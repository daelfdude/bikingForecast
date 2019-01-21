package com.lumpy.server;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;
import java.time.temporal.ChronoField;

import org.junit.jupiter.api.Test;

public class FirstControllerTest {

	@Test
	public void testIt() {
		assertThat(new FirstController().index()).satisfies(this::containsExpectedDynamicText);
	}

	private void containsExpectedDynamicText(String txt) {
		LocalDateTime now = LocalDateTime.now();
		String month = String.valueOf(now.getMonth().getValue());
		String year = String.valueOf(now.getYear()).substring(2);
		String day = String.valueOf(now.getDayOfMonth());
		String min = String.valueOf(now.getMinute());
		String hour = String.valueOf(now.get(ChronoField.HOUR_OF_AMPM));
		assertThat(txt).contains("Hello", month, day, year, hour, min);
	}
}
