package hmarket_package;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateCal {
	public static String getCurrntTimePlusDay(int day) { // ���糯¥�� �Ű������� �־��� �ϼ���ŭ ���ؼ� ����ϴ� �޼ҵ�
		LocalDate now = LocalDate.now(); // ���糯¥ ���ϱ�
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd"); // ����
		now = now.plusDays(day); // �Ű����� �ϼ���ŭ ����
		String result = now.format(formatter);
		return result;
	}
}
