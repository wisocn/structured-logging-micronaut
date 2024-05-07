package com.logging.filters;

import io.micronaut.http.HttpHeaders;
import io.micronaut.http.HttpRequest;
import io.micronaut.http.MutableHttpResponse;
import io.micronaut.http.annotation.RequestFilter;
import io.micronaut.http.annotation.ResponseFilter;
import io.micronaut.http.annotation.ServerFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

import java.util.Optional;
import java.util.UUID;

@ServerFilter("/**") // (1)
public class ServletFilter {

    private static final Logger log = LoggerFactory.getLogger(ServletFilter.class);

    @RequestFilter
    public void filterRequest(HttpRequest<?> request) {
        MDC.put("trxid", getTrxId(request.getHeaders()));
        log.info("Incoming request {}", request.toString());
    }

    private String getTrxId(HttpHeaders httpHeaders){
        return Optional.ofNullable(httpHeaders)
                .map(headers -> headers.get("x-trxid"))
                .orElse(UUID.randomUUID().toString());
    }

    @ResponseFilter // (5)
    public void filterResponse(MutableHttpResponse<?> res) {
        log.info("Outgoing response {}", res);
    }

}
