package com.lumpy;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

public class FirstClassTest {

	@Test
	public void testIt() {
		String result = new FirstClass().first(1);
		assertThat(result).isEqualTo("first 1");
	}
}
