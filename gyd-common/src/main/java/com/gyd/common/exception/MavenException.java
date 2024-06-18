package com.gyd.common.exception;

/**
 */
public class MavenException extends RuntimeException {
    public MavenException(Exception e) {
        super(e);
    }

    public MavenException(String message) {
        super(message);
    }

}
