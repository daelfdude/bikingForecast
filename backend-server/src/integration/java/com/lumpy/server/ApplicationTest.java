package com.lumpy.server;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

public class ApplicationTest {

	@Test
	public void testIt() {
		Application.main(new String[0]);
	}

	@AfterEach
	public void waitForTeardown() {
		Application.ensureStopped();
	}
}
