package com.logging.resources;

import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.PathVariable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static io.micronaut.http.HttpResponse.ok;

@Controller("/threads")
public class ThreadsResource {

    private static final Logger log = LoggerFactory.getLogger(ThreadsResource.class);

    @Get("/virtual/{num}")
    public HttpResponse<?> sentLogExample(@PathVariable("num") Integer number) {
        long startTime = System.nanoTime();
        createThread(number, Kind.VIRTUAL)
                .forEach(this::startAndJoin);
        logTime(startTime);
        return ok();
    }

    private void logTime(long start){
        long endTime = System.nanoTime();
        long elapsedTime = endTime - start;

        // Convert nanoseconds to milliseconds for easier readability
        double milliseconds = (double) elapsedTime / 1_000_000.0;

        System.out.println("Elapsed time: " + milliseconds + " milliseconds");
    }

    @Get("/platform/{num}")
    public HttpResponse<?> platformThread(@PathVariable("num") Integer number) throws InterruptedException {
        long startTime = System.nanoTime();
        createThread(number, Kind.PLATFORM)
                .forEach(this::startAndJoin);
        logTime(startTime);
        return ok();
    }

    private void startAndJoin(Thread t){
        t.start();
    }

    enum Kind {
        PLATFORM,
        VIRTUAL
    }

    private List<Thread> createThread(Integer number, Kind kind) {
       return IntStream.range(0, number)
               .mapToObj(it -> createThread(5000, kind))
               .collect(Collectors.toList());
    }
    private Thread createThread(int milisSleep, Kind kind) {
        return switch (kind){
            case PLATFORM -> createPlatformThread(milisSleep);
            case VIRTUAL -> createVirtualThread(milisSleep);
        };
    }

    private Thread createPlatformThread(int milis){
       return Thread.ofPlatform().unstarted(() -> {
            try {
                Thread.sleep(milis);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        });
    }

    private Thread createVirtualThread(int milis){
        return Thread.ofVirtual().unstarted(() -> {
            try {
                Thread.sleep(milis);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        });
    }
}