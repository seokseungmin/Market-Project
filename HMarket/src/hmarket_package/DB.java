package hmarket_package;

import java.sql.*;
import java.util.Vector;


/**
 * [ DB ] Ŭ����: �л� ���, �л� �˻� ���� ���������� �����ϴ� Ŭ����
 *   
 *  o �� Ŭ������ ��� ��������� �޼ҵ�� static���� ����
 *  
 *  o main() �޼ҵ忡�� DB Ŭ���� ��ü �������� �ʰ� 
 *    static �޼ҵ带 ȣ���Ͽ� �۾� ����
 */

public class DB {

	static Connection con  = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	public static void getConnection() {
        
		String database 	= "gmarketproject"; 
        String user_name    = "root";
        String password     = "onlyroot";        
             
        // ����̹� �ε�
        try {
            	Object o = Class.forName("com.mysql.jdbc.Driver");
        } catch ( java.lang.ClassNotFoundException e ) {
                System.err.println("  !! <JDBC ���� > Driver load ����: " + e.getMessage() );
                e.printStackTrace();
        }
        
        try {
                // �����ϱ� - �־��� serverID�� ������ �����Ű�� ���� server[] �迭 ���
                con  = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database + "?characterEncoding=euckr",
	                                                              user_name, password );
                // Statement ����
                stmt = con.createStatement();
 
		} catch( SQLException ex ) {               
                System.err.println("conn ����:" + ex.getMessage() );
                ex.printStackTrace();
  	    }	
	}
	
	public static void close() { // �ݱ� �����ϴ� �޼ҵ�	
    	try {
     		if( stmt != null ) stmt.close();
    		//if( con != null ) con.close();
                    
    	} catch (SQLException ex ) {}; 	
    }
	
	
	public static Vector<Customer> getVectorSelectedCustomer(String sql){ // �־��� sql���� �ؼ��� ���� �������� �� Ŭ���� ���� ��ü�� ��Ƽ� ��ȯ
		Vector<Customer> customers = new Vector<Customer>();

		try {
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String cid = rs.getString("cid");
				String password = rs.getString("password");
				String cname = rs.getString("cname");
				String address = rs.getString("address");
				String phoneNo = rs.getString("phoneNo");
				
				Customer ct = new Customer(cid, password, cname, address, phoneNo);
				customers.add(ct);
			}
		}
		catch(SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );        
		}
		return customers;
	}
	
	public static ResultSet getAllProduct() { // ��� ��ǰ rs�� ��ȯ�ϴ� �޼ҵ�
		try {
			rs = stmt.executeQuery("select * from product");
			return rs;
		} catch (SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );    
			e.printStackTrace();
			return null;
		}
	}
	public static ResultSet getProductByPno(int pno) { // pno�־����� �ش� ��ǰ ������ ����ϴ� �޼ҵ�
		try {
			rs = stmt.executeQuery("select * from product where pno = '"+pno+"';");
			return rs;
		} catch (SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );    
			e.printStackTrace();
			return null;
		}
	}
	
	public static Vector<Vendor> getVectorSelectedVendor(String sql){ // �־��� sql���� �ؼ��� �Ǹž�ü�� �������� �Ǹž�ü Ŭ���� ���� ��ü�� ��Ƽ� ��ȯ
		Vector<Vendor> vendors = new Vector<Vendor>();

		try {
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String vid = rs.getString("vid");
				String password = rs.getString("password");
				String vname = rs.getString("vname");
				String address = rs.getString("address");
				String phoneNo = rs.getString("phoneNo");
				
				Vendor vd = new Vendor(vid, password, vname, address, phoneNo);
				vendors.add(vd);
			}
		}
		catch(SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );        
		}
		return vendors;
	}
	
	public static Vector<Product> getVectorSelectedProduct(String sql){ // �־��� sql���� �ؼ��� ��ǰ�� �������� ��ǰ Ŭ���� ���� ��ü�� ��Ƽ� ��ȯ
		Vector<Product> products = new Vector<Product>();

		try {
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				String vid = rs.getString("vid");
				String enrolDate = rs.getString("enrolDate");
				
				Product pd = new Product(pno, pname, price, vid, enrolDate);
				products.add(pd);
			}
		}
		catch(SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );        
		}
		return products;
	}
	
	public static Vector<Purchase> getVectorSelectedPurchase(String sql){ // �־��� sql���� �ؼ��� ���� �������� ���� Ŭ���� ���� ��ü�� ��Ƽ� ��ȯ
		Vector<Purchase> purchases = new Vector<Purchase>();

		try {
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int orderNo = rs.getInt("orderNo");
				String cid = rs.getString("cid");
				int pno = rs.getInt("pno");
				int orderCount = rs.getInt("orderCount");
				int paymentAmount = rs.getInt("paymentAmount");
				String orderDate = rs.getString("orderDate");
				String paymentMethod = rs.getString("paymentMethod");
				String orderStatus = rs.getString("orderStatus");
				Purchase pc = new Purchase(orderNo, cid, pno, orderCount, paymentAmount, orderDate, paymentMethod, orderStatus);
				purchases.add(pc);
			}
		}
		catch(SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );
		}
		return purchases;
	}
	
//	public static Purchase getSelectedPurchase(String sql) {
//		try {
//			rs = stmt.executeQuery(sql);
//			Purchase pc = null;
//			while(rs.next()) {
//				int orderNo = rs.getInt("orderNo");
//				String cid = rs.getString("cid");
//				int pno = rs.getInt("pno");
//				int orderCount = rs.getInt("orderCount");
//				int paymentAmount = rs.getInt("paymentAmount");
//				String orderDate = rs.getString("orderDate");
//				String paymentMethod = rs.getString("paymentMethod");
//				String orderStatus = rs.getString("orderStatus");
//				pc = new Purchase(orderNo, cid, pno, orderCount, paymentAmount, orderDate, paymentMethod, orderStatus);
//			}
//			return pc;
//		}
//		catch(SQLException e) {
//			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );
//			return null;
//		}
//	}
	
	public static ResultSet getLoginedPurchaseInfo(String cid) { // �α����� ���� �ֹ���ȸ �Ҷ� ����� ������ rs������ ��ȯ (������ ���� ���)
		try {
			String sql = "select orderNo, pname, orderCount, paymentAmount, orderDate, paymentMethod, orderStatus"
					+ " from purchase, product where purchase.pno = product.pno and cid = '"+cid+"';";
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static ResultSet getLoginedCanceledPurchaseInfo(String cid) { // �α����� ���� ��ҵ� �ֹ��� ��ȸ �Ҷ� ����� ������ rs������ ��ȯ (������ ���� ���)
		try {
			String sql = "select cancelDate, cancelResult, pname, orderCount, paymentAmount, orderDate, paymentMethod"
					+ " from canceled_purchase, product where canceled_purchase.pno = product.pno and cid = '"+cid+"';";
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static ResultSet getLoginedDeliverInfo(String cid) { // �α����� ���� ��������� rs������ ��ȯ
		try {
			String sql = "select dno, vname, pno, sendDate, arrivalDate, deliveryStatus from deliver, vendor where deliver.vid = vendor.vid and cid = '"+cid+"';";
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static ResultSet getLoginedVendorProduct(String vid) { // �α����� ��ü�� ��ϻ�ǰ���� rs������ ��ȯ
		try {
			String sql = "select pno, pname, price, enrolDate from product where vid = '"+vid+"';";
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static ResultSet getRequestedOrder(String vid) { // �α����� ��ü�� ��û���� �ֹ��� rs������ ��ȯ
		try {
			String sql = "select orderNo, purchase.pno, orderCount, orderDate, paymentMethod from purchase, product where purchase.pno = product.pno and vid = '"+vid+"' and orderStatus = '�ֹ�ó����';";
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static String getCidByOrderNo(int orderNo) { // �ֹ���ȣ �־����� �ش� �ֹ��� �� �����̵� ��ȯ
		try {
			String sql = "select cid from purchase where orderNo = '"+orderNo+"';";
			rs = stmt.executeQuery(sql);
			String result = "";
			while(rs.next()) {
				result = rs.getString("cid");
			}
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static int getPnoByOrderNo(int orderNo) { // �ֹ���ȣ �־����� �ش� �ֹ������� ��ǰ��ȣ�� ��ȯ
		try {
			String sql = "select pno from purchase where orderNo = '"+orderNo+"';";
			rs = stmt.executeQuery(sql);
			int result = 0;
			while(rs.next()) {
				result = rs.getInt("pno");
			}
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	public static Vector<Deliver> getVectorSelectedDeliver(String sql){ // �־��� sql���� �ؼ��� ��� �������� ��� Ŭ���� ���� ��ü�� ��Ƽ� ��ȯ
		Vector<Deliver> delivers = new Vector<Deliver>();

		try {
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int dno = rs.getInt("dno");
				String vid = rs.getString("vid");
				String cid = rs.getString("cid");
				int pno = rs.getInt("pno");
				String sendDate = rs.getString("sendDate");
				String arrivalDate = rs.getString("arrivalDate");
				String deliveryStatus = rs.getString("deliveryStatus");
				
				Deliver dv = new Deliver(dno, vid, cid, pno, sendDate, arrivalDate, deliveryStatus);
				delivers.add(dv);
			}
		}
		catch(SQLException e) {
			System.err.println("SQL�� ��� ���� ����:" + e.getMessage() );        
		}
		return delivers;
	}
	
//	public static String getCnameByCid(String cid) { // cid�� cname ã�Ƽ� ��ȯ
//		try {
//			rs = stmt.executeQuery("select cname from customer where cid = '"+cid+"';");
//			String result = "";
//			while(rs.next()) {
//				result = rs.getString("cname");
//			}
//			return result;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
//	public static String getVnameByVid(String vid) { // vid�� vname ã�Ƽ� ��ȯ
//		try {
//			rs = stmt.executeQuery("select vname from vendor where vid = '"+vid+"';");
//			String result = "";
//			while(rs.next()) {
//				result = rs.getString("vname");
//			}
//			return result;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
//	public static String getAddressByCid(String cid) { // cid�� �ּ� ã�Ƽ� ��ȯ
//		try {
//			rs = stmt.executeQuery("select address from customer where cid = '"+cid+"';");
//			String result = "";
//			while(rs.next()) {
//				result = rs.getString("address");
//			}
//			return result;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
	public static String getPnameByPno(String pno) { // pno�� pname ã�Ƽ� ��ȯ
		try {
			rs = stmt.executeQuery("select pname from product where pno = '"+pno+"';");
			String result = "";
			while(rs.next()) {
				result = rs.getString("pname");
			}
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	

	public static int insertCustomerObject(Customer c) { // ȸ�� Ŭ���� ��ü�� �޾Ƽ� DB�� �� ȸ�� �߰��ϴ� �޼ҵ�
		String sql = "insert into customer values('"+c.cid+"', '"+c.password+"', '"+c.cname+"', '"+c.address+"', '"+c.phoneNo+"');"; // insert sql��
		try {
			int cnt = stmt.executeUpdate(sql); // insert�� ����
			if(cnt == 1) { // �� sql���� ���޵Ǿ 1�� ���������� ��ȯ�ϸ�
				System.out.println("ȸ�� ������ �Ϸ�Ǿ����ϴ�"); // ȸ������ ����
			}
			else {
				System.out.println("ȸ�� ���Կ� �����Ͽ����ϴ�");
			}
			return cnt;
		}
		catch (SQLException e) { // �ߺ��Ǵ� ID(Primary key)�� ������� ����ó���ʰ� ���ÿ� ȸ������ ���и� �˷��ֵ��� ��
			System.err.println("�ߺ��Ǵ� ���̵� �����մϴ� !! : " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	public static Customer searchCustomer(String cid, String password) { // DB���� �Էµ� ���̵�� �н����尡 ��ġ�ϴ� ȸ���� ã�Ƽ� ��ȯ�ϴ� �޼ҵ� (�α��� ��ɿ� ����)
		String sql = "select * from customer where cid = '" +cid+ "' and password = '" +password+ "';"; // �Ű������� ���� ���̵�� �н����尡 ��ġ�ϴ� ȸ���� select�� �˻�
		try {
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) { // ���پ� ���� (rs�� ���� ������� ������� �� while���� �۵����� �ʴ´�)
				Customer c = new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)); // rs�� ���� ������ �̿��ؼ� c��ü�� ����
				return c;
			}
		}
		catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return null;
		}
		return null; // while���� �۵��ȵǸ� �ٷ� null�� ��ȯ�Ѵ�
	}
	
	public static int insertVendorObject(Vendor v) { // �Ǹž�ü Ŭ���� ��ü�� �޾Ƽ� DB�� ȸ�� �߰��ϴ� �޼ҵ�
		String sql = "insert into vendor values('"+v.vid+"', '"+v.password+"', '"+v.vname+"', '"+v.address+"', '"+v.phoneNo+"');"; // insert sql��
		try {
			int cnt = stmt.executeUpdate(sql); // insert�� ����
			if(cnt == 1) { // �� sql���� ���޵Ǿ 1�� ���������� ��ȯ�ϸ�
				System.out.println("ȸ�� ������ �Ϸ�Ǿ����ϴ�"); // ȸ������ ����
			}
			else {
				System.out.println("ȸ�� ���Կ� �����Ͽ����ϴ�");
			}
			return cnt;
		}
		catch (SQLException e) { // �ߺ��Ǵ� ID(Primary key)�� ������� ����ó���ʰ� ���ÿ� ȸ������ ���и� �˷��ֵ��� ��
			System.err.println("�ߺ��Ǵ� ���̵� �����մϴ� !! : " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	public static Vendor searchVendor(String vid, String password) { // DB���� �Էµ� ���̵�� �н����尡 ��ġ�ϴ� �Ǹž�ü ȸ���� ã�Ƽ� ��ȯ�ϴ� �޼ҵ� (�Ǹž�ü �α��� ��ɿ� ����)
		String sql = "select * from vendor where vid = '" +vid+ "' and password = '" +password+ "';"; // �Ű������� ���� ���̵�� �н����尡 ��ġ�ϴ� ȸ���� select�� �˻�
		try {
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) { // ���پ� ���� (rs�� ���� ������� ������� �� while���� �۵����� �ʴ´�)
				Vendor v = new Vendor(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)); // rs�� ���� ������ �̿��ؼ� c��ü�� ����
				return v;
			}
		}
		catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return null;
		}
		return null; // while���� �۵��ȵǸ� �ٷ� null�� ��ȯ�Ѵ�
	}
	// -------------------------------------------------------------------------------------------------
	
	public static int insertProductObject(Product p) { // ��ǰ ���̺� ���ο� ��ǰ ��ü ����
		String sql = "insert into product values('"+p.pno+"', '"+p.pname+"', '"+p.price+"', '"+p.vid+"', '"+p.enrolDate+"')";
		try {
			int cnt = stmt.executeUpdate(sql);
			if(cnt != 1) {
				System.err.println("���������� ���Ե��� �ʾҽ��ϴ�");
			}
			return cnt;
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int insertDeliverObject(Deliver d) { // ��� ���̺� ���ο� ��� ��ü ����
		String sql = "insert into deliver values('"+d.dno+"', '"+d.vid+"', '"+d.cid+"', '"+d.pno+"', '"+d.sendDate+"', '"+d.arrivalDate+"', '"+d.deliveryStatus+"')";
		try {
			int cnt = stmt.executeUpdate(sql);
			if(cnt != 1) {
				System.err.println("���������� ���Ե��� �ʾҽ��ϴ�");
			}
			return cnt;
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
		
	public static int insertPurchaseObject(Purchase p) { // ���� ���̺� ���ο� ���� ��ü ����
		String sql = "insert into purchase values('"+p.orderNo+"', '"+p.cid+"', '"+p.pno+"', '"+p.orderCount+"', '"+p.paymentAmount+"', '"+p.orderDate+"', '"+p.paymentMethod+"', '"+p.orderStatus+"');";
		try {
			int cnt = stmt.executeUpdate(sql);
			if(cnt != 1) {
				System.err.println("���������� ���Ե��� �ʾҽ��ϴ�");
			}
			return cnt;
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int calculatePaymentAmount(int pno, int orderCount) { // ��ǰ��ȣ�� ���� ������ �Ű������� �޾� �� �����ݾ� ����ؼ� ��ȯ�ϴ� �޼ҵ�
		Vector<Product> product = getVectorSelectedProduct("select * from product where pno = '"+pno+"';");
		int paymentAmount = product.get(0).price * orderCount;
		return paymentAmount;
	}
	
	public static int deletePurchaseObject(int orderNo) { // �ֹ� ���� ó�� �޼ҵ�
		String sql = "delete from purchase where orderNo = '"+orderNo+"'";
		try {
			int cnt = stmt.executeUpdate(sql);
			return cnt;
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int deleteProductObject(int pno) { // ��ǰ ���� ó�� �޼ҵ�
		String sql = "delete from product where pno = '"+pno+"'";
		try {
			int cnt = stmt.executeUpdate(sql);
			return cnt;
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int insertCanceledPurchaseObject(int orderNo) { // �ֹ� ���� �� ���� ������ canceled_purchase ���̺� ����
		Vector<Purchase> p = getVectorSelectedPurchase("select * from purchase where orderNo = '"+orderNo+"';");
		
		String sql = "insert into canceled_purchase values('"+DateCal.getCurrntTimePlusDay(0)+"', '"+"��ҿϷ�"+"', '"+p.get(0).cid+"', '"+p.get(0).pno+"', '"+p.get(0).orderCount+"', '"+p.get(0).paymentAmount+"', '"+p.get(0).orderDate+"', '"+p.get(0).paymentMethod+"', '"+p.get(0).orderStatus+"');";
		try {
			int cnt = stmt.executeUpdate(sql);
			return cnt;
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}

	
//	public static int insertCanceledPurchaseObject2(Purchase p) { // �ֹ� ���� �� ���� ������ canceled_purchase ���̺� ����
//		String sql = "insert into canceled_purchase values('"+DateCal.getCurrntTimePlusDay(0)+"', '"+"��ҿϷ�"+"', '"+p.cid+"', '"+p.pno+"', '"+p.orderCount+"', '"+p.paymentAmount+"', '"+p.orderDate+"', '"+p.paymentMethod+"', '"+p.orderStatus+"');";
//		try {
//			int cnt = stmt.executeUpdate(sql);
//			return cnt;
//		} catch (SQLException e) {
//			System.err.println("SQL ���� : " + e.getMessage());
//			e.printStackTrace();
//			return 0;
//		}
//	}
	
	
	public static boolean isBeforeProcessOrder(int orderNo) { // �ֹ���ȣ�� �־����� �ش� �ֹ��� ó�����°� "�ֹ�ó����" �����̸� true�� ��ȯ
		String sql = "select orderStatus from purchase where orderNo = '"+orderNo+"';";
		try {
			String result = "";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				result = rs.getString("orderStatus");
			}
			if(result.equals("�ֹ�ó����")) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}
	
	public static int getNewPurchaseOrderNo() { // ���ο� ���� ��ü�� �����ɶ� ���Ӱ� ������ �ֹ���ȣ�� ����ؼ� ��ȯ
		try {
			rs = stmt.executeQuery("select * from purchase;");
			rs.last(); // ������ Ŀ���� �̵�
			int lastOrderNo = rs.getInt("orderNo");
			return lastOrderNo + 1; // ������ �ֹ���ȣ + 1�� ��ȯ
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int getNewProductNo() { // ���ο� ��ǰ ��ü�� �����ɶ� ���Ӱ� ������ ��ǰ��ȣ�� ����ؼ� ��ȯ
		try {
			rs = stmt.executeQuery("select * from Product;");
			rs.last(); // ������ Ŀ���� �̵�
			int lastPno = rs.getInt("pno");
			return lastPno + 100; // ������ ��ȣ + 100�� ��ȯ
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int getNewDeliverNo() { // ���ο� ��� ��ü�� �����ɶ� ���Ӱ� ������ �����ȣ�� ����ؼ� ��ȯ
		try {
			rs = stmt.executeQuery("select * from deliver;");
			rs.last(); // ������ Ŀ���� �̵�
			int lastDno = rs.getInt("dno");
			return lastDno + 100; // ������ ��ȣ + 100�� ��ȯ
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}
	
//	public static Vendor getVendorNameByPno(int pno) { // ��ǰ��ȣ�� �־����� �ش� ��ǰ�� ����� �Ǹž�ü ��ü�� ��ȯ
//		try {
//			rs = stmt.executeQuery("select * from product where pno = '"+pno+"';");
//			String vid = rs.getString("vid"); // �ش� ��ǰ�� ����� �Ǹž�ü ���̵� �����´�
//			rs = stmt.executeQuery("select * from vendor where vid = '"+vid+"';");
//			while (rs.next()) { // ���پ� ���� (rs�� ���� ������� ������� �� while���� �۵����� �ʴ´�)
//				Vendor v = new Vendor(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)); // rs�� ���� ������ �̿��ؼ� v��ü�� ����
//				return v;
//			}
//		} catch (SQLException e) {
//			System.err.println("SQL ���� : " + e.getMessage());
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	public static void updateOrderStatus(int orderNo) { // ���ó���ϸ� �ֹ�ó����Ȳ ������Ʈ ���ִ� �޼ҵ� (�ֹ���ȣ�� �Ű������� ����)
		try {
			int cnt = stmt.executeUpdate("update purchase set orderStatus = '"+"�ֹ�ó���Ϸ�"+"' where orderNo = '"+orderNo+"';");
		} catch (SQLException e) {
			System.err.println("SQL ���� : " + e.getMessage());
			e.printStackTrace();
		}
	}
}
