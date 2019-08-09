package com.binomo.server;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.util.concurrent.atomic.LongAdder;

@RestController
public class MyController {

    public static final Mono<String> OK = Mono.just("Ok");

    private LongAdder counter = new LongAdder();

    @GetMapping("/test/add")
    public Mono<String> add() {
        counter.increment();
        return OK;
    }

    @GetMapping("/test/get")
    public Mono<String> get() {
        return Mono.just(counter.toString());
    }

    @GetMapping("/test/reset")
    public Mono<String> reset() {
        counter.reset();
        return OK;
    }
}
