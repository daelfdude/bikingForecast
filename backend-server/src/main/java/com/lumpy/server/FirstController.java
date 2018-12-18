package com.lumpy.server;

import java.text.SimpleDateFormat;
import java.util.Date;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

@Controller("/first")
public class FirstController {

	@Get("/")
	public String index() {
		return "Hello Micronaut-user, the time is: " + new SimpleDateFormat().format(new Date());
	}
}