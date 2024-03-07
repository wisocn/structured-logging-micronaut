package com.logging.resources;

import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static io.micronaut.http.HttpResponse.ok;

@Controller("/log")
public class LogResource {

    private static final Logger log = LoggerFactory.getLogger(LogResource.class);

    @Get("/{sent}")
    public HttpResponse<?> sentLogExample(String sent) {
        log.info("This is a log from controller {}", sent);
        return ok(sent);
    }


}
