package com.logging;

import ch.qos.logback.classic.LoggerContext;
import io.micronaut.runtime.Micronaut;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ConcurrentHashMap;

public class Application {


    /**
     * @return The logback {@link LoggerContext}
     */
    private static LoggerContext getLoggerContext() {
        return (LoggerContext) LoggerFactory.getILoggerFactory();
    }

    public static void main(String[] args) {
        Micronaut.run(Application.class, args);
    }
}