package com.devsecureops;

import java.time.Instant;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatusController {
    @GetMapping("/")
    public Map<String, Object> home() {
        return Map.of(
            "project", "DevSecureOps",
            "message", "Automated CI/CD and container deployment demo is running!",
            "version", "1.0.0",
            "timestamp", Instant.now().toString()
        );
    }

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of("status", "UP");
    }
}
