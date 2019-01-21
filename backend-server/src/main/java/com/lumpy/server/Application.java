package com.lumpy.server;

import java.util.Optional;

import io.micronaut.context.ApplicationContext;
import io.micronaut.runtime.Micronaut;

public class Application {

	private static ApplicationContext ctxt;

	public static void main(String[] args) {
		ctxt = Micronaut.run(Application.class);
		ctxt.stop();
	}

	public static void ensureStopped() {
		Optional.ofNullable(ctxt).ifPresent(ApplicationContext::stop);
	}
}