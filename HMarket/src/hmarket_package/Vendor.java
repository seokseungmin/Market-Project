package hmarket_package;

public class Vendor {
	String vid;
	String password;
	String vname;
	String address;
	String phoneNo;
	
	public Vendor(String vid, String password, String vname, String address, String phoneNo) {
		this.vid = vid; this.password = password; this.vname = vname;
		this.address = address; this.phoneNo = phoneNo;
	}
	
	public String getVid() {
		return this.vid;
	}
	public String getPassword() {
		return this.password;
	}
	public String getVname() {
		return this.vname;
	}
	public String getAddress() {
		return this.address;
	}
	public String getPhoneNo() {
		return this.phoneNo;
	}
	
	public String toString() { // toString �޼ҵ�
		return "���̵� : " + this.vid + " / �н����� : " + this.password + " / ��ü�� : " + this.vname + " / �ּ� : " + this.address + " / ��ȭ��ȣ : " + this.phoneNo;
	}
}
