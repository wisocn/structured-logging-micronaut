package com.logging;

import io.micronaut.runtime.Micronaut;

import java.util.concurrent.ConcurrentHashMap;

public class Application {

    public static void main(String[] args) {
        Micronaut.run(Application.class, args);


       var x = new ConcurrentHashMap<String, String>();
       x.put("", "");
    }
}