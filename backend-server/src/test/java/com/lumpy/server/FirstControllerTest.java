package com.lumpy.server;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import io.micronaut.context.ApplicationContext;
import io.micronaut.http.HttpStatus;
import io.micronaut.http.client.RxHttpClient;
import io.micronaut.runtime.server.EmbeddedServer;

public class FirstControllerTest {

	@Test
	public void testIndex() throws Exception {
		try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class)) {
			try (RxHttpClient client = server.getApplicationContext().createBean(RxHttpClient.class, server.getURL())) {
				assertEquals(HttpStatus.OK, client.toBlocking().exchange("/first").status());
			}
		}
	}

}
