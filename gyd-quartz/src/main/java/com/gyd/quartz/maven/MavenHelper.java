package com.gyd.quartz.maven;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.google.gson.*;
import com.gyd.common.exception.MavenException;
import com.gyd.common.utils.http.HttpUtils;
import com.gyd.quartz.domain.MavenModel;
import org.apache.maven.shared.invoker.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import java.io.*;
import java.net.InetAddress;
import java.net.URL;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * 必须先联系运维在线上机器安装Maven，并设置maven.home的目录
 */
public class MavenHelper {

    private static Gson gson = new GsonBuilder().setPrettyPrinting().create();

    private static final String DEPENDENCY_CMD = "dependency::tree";

    private static Logger LOGGER = LoggerFactory.getLogger(MavenHelper.class);

    public static MavenModel getMavenModel(String mavenPom) {
        String[] lines = mavenPom.split(" ");
        MavenModel mavenModel = new MavenModel();
        for (String string : lines) {
            String result = string.replace(" ", "");
            if (string.contains("artifactId")) {
                mavenModel.setArtifactId(result.replace("<artifactId>", "").replace("</artifactId>", ""));
            } else if (string.contains("groupId")) {
                mavenModel.setGroupId(result.replace("<groupId>", "").replace("</groupId>", ""));
            } else if (string.contains("version")) {
                mavenModel.setVersion(result.replace("<version>", "").replace("</version>", ""));
            }
        }
        return mavenModel;
    }

    static synchronized List<MavenModel> getDependencyMavenModelExcludeLocalJar(MavenModel mavenModel) {
        String directory = "/opt/" + UUID.randomUUID() + "/";
        unzipProject(directory);
        List<MavenModel> mavenModelList = getDependencyMavenModel(mavenModel, directory);
        Set<String> localJarList = getAllLocalJarName(directory);
        LOGGER.info("Local Jar = {}", gson.toJson(localJarList));
        if (CollectionUtils.isEmpty(mavenModelList) || CollectionUtils.isEmpty(localJarList)) {
            return mavenModelList;
        }
        return mavenModelList.stream()
                .filter(o -> !localJarList.contains(o.getArtifactId()))
                .collect(Collectors.toList());

    }

    private static Set<String> getAllLocalJarName(String directory) {
        try {
            String path = directory + "BOOT-INF/lib";
            File file = new File(path);
            Set<String> localJarNameSet = Sets.newHashSet();
            File[] fs = file.listFiles();    //遍历path下的文件和目录，放在File数组中
            for (File f : fs) {                    //遍历File[]数组
                if (!f.isDirectory() && f.getName().contains(".jar")) {
                    String jar = f.getName().split(".jar")[0];
                    int index = jar.lastIndexOf("-");
                    if (index < 0) {
                        localJarNameSet.add(jar);
                    }
                    localJarNameSet.add(jar.substring(0, index));
                }
            }
            return localJarNameSet;
        } catch (Exception e) {
            LOGGER.error("getAllLocalJarName failed", e);
            return Sets.newHashSet();
        }
    }


    private static synchronized void unzipProject(String directory) {
        try {
            String command = "unzip -o -d " + directory + " D:\\xxxtarget\\cache-center-core-1.0-SNAPSHOT.jar";
            LOGGER.info("command = {}", command);
            Process process = Runtime.getRuntime().exec(command);
            InputStream inputStream = process.getInputStream();
            InputStream errorStream = process.getErrorStream();
            List<String> messageList = getMessage(inputStream);
            List<String> errorList = getMessage(errorStream);
            LOGGER.info("process message = {}", gson.toJson(messageList));
            LOGGER.info("process error = {}", gson.toJson(errorList));
            process.wait(10000);
        } catch (Exception e) {
            LOGGER.error("unzipProject failed", e);
        }
    }

    private static List<String> getMessage(InputStream inputStream) throws IOException {
        if (inputStream == null) {
            return null;
        }
        try {
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            List<String> messageList = Lists.newArrayList();
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                messageList.add(line);
            }
            return messageList;
        } finally {
            try {
                inputStream.close();
            } catch (Exception e) {
                LOGGER.info("close failed", e);
            }
        }
    }

    private static List<MavenModel> getDependencyMavenModel(MavenModel mavenModel, String directory) {
        //maven-invoker用法：https://maven.apache.org/shared/maven-invoker/usage.html
        InvocationRequest invocationRequest = new DefaultInvocationRequest();
        invocationRequest.setPomFile(getPomFile(mavenModel));
//        invocationRequest.setUserSettingsFile(new File(directory + "META-INF/settings.xml"));
        invocationRequest.setGoals(Collections.singletonList(DEPENDENCY_CMD));
        List<MavenModel> mavenModelList = Lists.newArrayList();
        invocationRequest.setOutputHandler((String var1) -> {
            if (var1.startsWith("[INFO]") && (var1.contains("+-") || var1.contains("\\-"))) {
                int startIndex = var1.contains("+-") ? var1.indexOf("+-") : var1.indexOf("\\-");
                String[] strings = var1.substring(startIndex + 3).split(":");
                MavenModel model = new MavenModel();
                model.setGroupId(strings[0]);
                model.setArtifactId(strings[1]);
                model.setPackaging(strings[2]);
                model.setVersion(strings[3]);
                mavenModelList.add(model);
            }
            LOGGER.info("maven info output message = {}", var1);
        });
        invocationRequest.setErrorHandler((String var1) -> {
            LOGGER.error("maven error output message = {}", var1);
        });
        Invoker invoker = new DefaultInvoker();
        try {
            LOGGER.info("hostAddress = {}", InetAddress.getLocalHost().getHostAddress());
            if (!InetAddress.getLocalHost().getHostAddress().contains("10.2")) {
                System.setProperty("maven.home", "/usr/local/apache-maven-3.6.1");//设置远程主机上的maven目录
            }
            InvocationResult invocationResult = invoker.execute(invocationRequest);

            if (invocationResult.getExecutionException() != null) {
                LOGGER.error("execute failed", invocationResult.getExecutionException());
                throw new MavenException(invocationResult.getExecutionException());
            }
            LOGGER.info("maven execute. result = {}", invocationResult.getExitCode());
            if (invocationResult.getExitCode() != 0) {
                throw new MavenException("maven exe failed, resultCode = " + invocationResult.getExitCode());
            }
        } catch (Exception e) {
            throw new MavenException(e);
        }
        return mavenModelList;
    }


    private static File getPomFile(MavenModel mavenModel) {
        File folder = new File("/opt/");
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }
        File file = new File("/opt/" + mavenModel.getArtifactId() + "-" + mavenModel.getVersion() + ".pom");
        try {
            if (!file.exists()) {
                boolean isNew = file.createNewFile();
                if (!isNew) {
                    return null;
                }
            }
            String pomContent = HttpUtils.sendGet(getPomUrlByMavenModel(mavenModel));
            try (FileOutputStream outStream = new FileOutputStream(file)) {
                outStream.write(pomContent.getBytes());
            }
            return file;
        } catch (IOException e) {
            LOGGER.error("getPomFile failed", e);
            return null;
        }
    }


    private static String getPomUrlByMavenModel(MavenModel mavenModel) {
        return getRepositoryUrl(mavenModel)
                + "/" + mavenModel.getArtifactId() + "-" + mavenModel.getVersion() + ".pom";
    }

    static URL getJarURLByMavenModel(MavenModel mavenModel) {
        if ("jar".equalsIgnoreCase(mavenModel.getPackaging())) {
            try {
//                if (mavenModel.getVersion().toUpperCase().contains("SNAPSHOT")) {
//                    String url = getRepositoryUrl(mavenModel);
//                    LOGGER.info("url = {}", url);
//                    return new URL(url);
//                }
                String url = getRepositoryUrl(mavenModel)
                        + "/" + mavenModel.getArtifactId() + "-" + mavenModel.getVersion() + ".jar";
                LOGGER.info("url = {}", url);
                return new URL(url);
            } catch (Exception e) {
                LOGGER.error("getJarURLByMavenModel failed", e);
                throw new MavenException("maven not legal. mavenModel = " + mavenModel.toString());
            }
        }
        throw new MavenException("packaging type not satisfy. mavenModel = " + mavenModel.toString());
    }


    //拉取jar包
    private static String getRepositoryUrl(MavenModel mavenModel) {
        String nexusUrl = "http://127.0.0.1:8088";//私服地址
//        示例：http://127.0.0.1:8088/repository/maven-releases/com/test/cache-center-biz-test/0.0.1/cache-center-biz-test-0.0.1.jar
        //正式jar包
            return nexusUrl+"/repository/maven-releases/"
                    + mavenModel.getGroupId().replace(".", "/")
                    + "/" + mavenModel.getArtifactId()
                    + "/" + mavenModel.getVersion();
    }

    public static void main(String[] args) throws ClassNotFoundException {
        String mavenPom = "<dependency>" +
                "  <groupId>com.gyd</groupId>" +
                "  <artifactId>gyd-quartz</artifactId>" +
                "  <version>1.0</version>" +
                " </dependency>";

        ClassLoader classLoader = ClassLoaderHelper.getCustomClassLoader(mavenPom);
        Thread.currentThread().setContextClassLoader(classLoader);

        Class clazz = Class.forName("com.gyd.quartz.task.BizTestTask");

        System.out.println(clazz);
    }


}
