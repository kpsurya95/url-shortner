package com.sample.urlshortner;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class UrlShortnerApplicationTests {

  @Test
  void contextLoads() {
    UrlShortner urlShortner = new UrlShortner();
    assertTrue(urlShortner.isValueExist());
  }
}
