package hmarket_package;

public class Product {
	int pno;
	String pname;
	int price;
	String vid;
	String enrolDate;
	
	public Product(int pno, String pname, int price, String vid, String enrolDate) { // ��ü ������
		this.pno = pno; this.pname = pname;
		this.price = price; this.vid = vid;
		this.enrolDate = enrolDate;
	}
}
