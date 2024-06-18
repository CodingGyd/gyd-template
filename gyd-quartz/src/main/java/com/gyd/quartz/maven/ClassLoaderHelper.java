package com.gyd.quartz.maven;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.gyd.common.utils.spring.SpringUtils;
import com.gyd.quartz.domain.MavenModel;
import com.gyd.quartz.domain.SysJob;
import com.gyd.quartz.mapper.SysJobMapper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 */
public final class ClassLoaderHelper {

    private static Gson gson = new GsonBuilder().setPrettyPrinting().create();

    private static Logger LOGGER = LoggerFactory.getLogger(ClassLoaderHelper.class);

    //如果用户页面上修改POM，10秒之后会自动替换
    private static final Cache<Long, ClassLoader> customClassLoaderMap = CacheBuilder.newBuilder().expireAfterWrite(10, TimeUnit.SECONDS).maximumSize(1000).build();

    private static final Cache<String, ClassLoader> pomClassLoaderMap = CacheBuilder.newBuilder().expireAfterAccess(60, TimeUnit.MINUTES).maximumSize(1000).build();


    public static ClassLoader getCustomClassLoader(long jobId) {
        if (customClassLoaderMap.getIfPresent(jobId) == null) {
            synchronized (customClassLoaderMap) {
                if (customClassLoaderMap.getIfPresent(jobId) == null) {
                    SysJob job = SpringUtils.getBean(SysJobMapper.class).selectJobById(jobId);
                    customClassLoaderMap.put(jobId, getCustomClassLoader(job.getMavenPom()));
                }
            }

        }
        return customClassLoaderMap.getIfPresent(jobId);
    }

    public static ClassLoader getCustomClassLoader(String mavenPom) {
        if (StringUtils.isBlank(mavenPom)) {
            return Thread.currentThread().getContextClassLoader();
        } else if (pomClassLoaderMap.getIfPresent(mavenPom) == null) {
            MavenModel mavenModel = MavenHelper.getMavenModel(mavenPom);
            synchronized (pomClassLoaderMap) {
                if (pomClassLoaderMap.getIfPresent(mavenPom) == null) {
                    //缓存操作  后续优化再开启
//                    StoreKey storeKey = new StoreKey("task_pom_mapping_jar", mavenPom);
//                    String cacheMavenModels = SpringBeanFinder.getService(RedisStoreClient.class).get(storeKey);
                    String cacheMavenModels = null;
                    List<MavenModel> mavenModelList;
                    if (StringUtils.isBlank(cacheMavenModels)) {
                        mavenModelList = MavenHelper.getDependencyMavenModelExcludeLocalJar(mavenModel);
                        mavenModelList.add(mavenModel);
                        LOGGER.info("getDependencyMavenModelExcludeLocalJar. mavenModelList = {}", gson.toJson(mavenModelList));
//                        SpringBeanFinder.getService(RedisStoreClient.class).set(storeKey, gson.toJson(mavenModelList));
                    } else {
                        mavenModelList = gson.fromJson(cacheMavenModels, new TypeToken<List<MavenModel>>() {
                        }.getType());
                    }
                    CustomClassLoader customClassLoader = new CustomClassLoader(mavenModelList, mavenModel.getArtifactId() + "-" + mavenModel.getVersion());
                    pomClassLoaderMap.put(mavenPom, customClassLoader);
                }
            }
        }
        return pomClassLoaderMap.getIfPresent(mavenPom);
    }

}
