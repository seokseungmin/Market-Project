package hmarket_package;


public class PasswordED {
	public static String encriptPassword(String password) {
		if (password==null || password.equals(""))
			return "1Ew$H6KhfKHJHG";			
		
		return "" + password.hashCode();
	}
}
