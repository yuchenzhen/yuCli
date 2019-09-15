package com.white.ycli.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/job")
@Slf4j
public class JobController {
    @PostMapping
    public String addJob() {
        return "test";
    }
}
