package hmarket_package;

public class Purchase {
	int orderNo;
	String cid;
	int pno;
	int orderCount;
	int paymentAmount;
	String orderDate;
	String paymentMethod;
	String orderStatus;
	
	public Purchase(int orderNo, String cid, int pno, int orderCount, int paymentAmount, String orderDate, String paymentMethod, String orderStatus){
		this.orderNo = orderNo; this.cid = cid; this.pno = pno; 
		this.orderCount = orderCount; this.paymentAmount = paymentAmount;
		this.orderDate = orderDate; this.paymentMethod = paymentMethod;
		this.orderStatus = orderStatus;
	}
	
	public String getCid(){
		return this.cid;
	}
	public int getPno() {
		return this.pno;
	}
	public int getOrderCount() {
		return this.orderCount;
	}
	public int getPaymentAmount() {
		return this.paymentAmount;
	}
	public String getOrderDate() {
		return this.orderDate;
	}
	public String getPaymentMethod() {
		return this.paymentMethod;
	}
	public String getOrderStatus() {
		return this.orderStatus;
	}
}
