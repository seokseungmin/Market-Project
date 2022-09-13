package hmarket_package;
import java.sql.*;
public class Customer {
	String cid;
	String password;
	String cname;
	String address;
	String phoneNo;
	
	public Customer(String cid, String password, String cname, String address, String phoneNo){ // 객체생성자
		this.cid = cid; this.password = password; this.cname = cname;
		this.address = address; this.phoneNo = phoneNo;
	}
	
	public String getCid() {
		return this.cid;
	}
	public String getPassword() {
		return this.password;
	}
	public String getCname() {
		return this.cname;
	}
	public String getAddress() {
		return this.address;
	}
	public String getPhoneNo() {
		return this.phoneNo;
	}
	
	public String toString() { // toString 메소드
		return "아이디 : " + this.cid + " / 패스워드 : " + this.password + " / 이름 : " + this.cname + " / 주소 : " + this.address + " / 핸드폰번호 : " + this.phoneNo;
	}
	
}
