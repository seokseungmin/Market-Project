package hmarket_package;

public class Deliver {
	int dno;
	String vid;
	String cid;
	int pno;
	String sendDate;
	String arrivalDate;
	String deliveryStatus;
	
	public Deliver(int dno, String vid, String cid, int pno, String sendDate, String arrivalDate, String deliveryStatus) {
		this.dno = dno; this.vid = vid; this.cid = cid; this.pno = pno; this.sendDate = sendDate;
		this.arrivalDate = arrivalDate; this.deliveryStatus = deliveryStatus;
	}
}
