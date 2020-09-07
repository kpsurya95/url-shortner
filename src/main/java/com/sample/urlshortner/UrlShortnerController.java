package com.sample.urlshortner;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/url-shortner")
public class UrlShortnerController {

  @GetMapping("/hello")
  public String sayHello() {
    return "Hello Sivaganesh";
  }
}
