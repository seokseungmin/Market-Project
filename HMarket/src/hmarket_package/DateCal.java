package hmarket_package;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateCal {
	public static String getCurrntTimePlusDay(int day) { // 현재날짜에 매개변수에 주어진 일수만큼 더해서 출력하는 메소드
		LocalDate now = LocalDate.now(); // 현재날짜 구하기
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd"); // 포맷
		now = now.plusDays(day); // 매개변수 일수만큼 더함
		String result = now.format(formatter);
		return result;
	}
}
