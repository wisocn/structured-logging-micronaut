package com.logging.filters;

import io.micronaut.http.HttpRequest;
import io.micronaut.http.MutableHttpResponse;
import io.micronaut.http.annotation.RequestFilter;
import io.micronaut.http.annotation.ResponseFilter;
import io.micronaut.http.annotation.ServerFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ServerFilter("/**") // (1)
public class ServletFilter {

    private static final Logger log = LoggerFactory.getLogger(ServletFilter.class);

    @RequestFilter
    public void filterRequest(HttpRequest<?> request) {
        log.info("Incoming request {}", request.toString());
    }

    @ResponseFilter // (5)
    public void filterResponse(MutableHttpResponse<?> res) {
        log.info("Outgoing response {}", res);
    }

}
