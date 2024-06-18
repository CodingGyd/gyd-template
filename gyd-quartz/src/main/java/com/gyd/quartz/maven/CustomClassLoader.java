package com.gyd.quartz.maven;


import com.gyd.quartz.domain.MavenModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URL;
import java.net.URLClassLoader;
import java.util.List;
import java.util.stream.Collectors;

/**
 */
public class CustomClassLoader extends URLClassLoader {

    private Logger logger = LoggerFactory.getLogger(URLClassLoader.class);

    private String identify;


    CustomClassLoader(List<MavenModel> mavenModelList, String identify) {
        super(mavenModelList.stream().map(MavenHelper::getJarURLByMavenModel).collect(Collectors.toList()).toArray(new URL[mavenModelList.size()]),
                Thread.currentThread().getContextClassLoader());
        this.identify = identify;

    }

    @Override
    protected Class<?> loadClass(String name, boolean resolve)
            throws ClassNotFoundException {
        try {
            return super.loadClass(name, resolve);
        } catch (ClassNotFoundException e) {
//            logger.info("loadClass failed, className = {}", name);
            throw e;
        }
    }

    @Override
    public String toString() {
        return "identify = " + identify + "@"+  Integer.toHexString(hashCode());
    }
}
