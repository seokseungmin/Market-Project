package hmarket_package;

public class CanceledPurchase {
	String cancelDate;
	String cancelResult;
	String cid;
	int pno;
	int orderCount;
	int paymentAmount;
	String orderDate;
	String paymentMethod;
	String orderStatus;
	
	public CanceledPurchase(String cancelDate, String cancelResult, String cid, int pno, int orderCount, int paymentAmount, String orderDate, String paymentMethod, String orderStatus) {
		this.cancelDate = cancelDate; this.cancelResult = cancelResult; this.cid = cid; this.pno = pno;
		this.orderCount = orderCount; this.paymentAmount = paymentAmount; this.orderDate = orderDate;
		this.paymentMethod = paymentMethod; this.orderStatus = orderStatus;
	}
}
