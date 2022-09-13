<<<<<<< HEAD
package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import service.DBUtil;
import vo.Customer;
import vo.Employee;

public class CustomerDao { 
		 
	//관리자 회원 비밀번호초기화
	public int adminUpdateCustomerPw(Connection conn, String customerId) throws Exception {
		
		int row = 0;
		String sql = "UPDATE customer"
				+ " SET customer_pass = PASSWORD(1234)"
				+ " WHERE customer_id = ?";

		PreparedStatement stmt = null;
		try {
			DBUtil dbUtil = new DBUtil();
			conn = dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, customerId);
			row = stmt.executeUpdate();
			System.out.println("row : " + row);

		}finally {
			stmt.close();
			conn.close();
		}

		return row;
	}
	
	//관리자 회원 강제탈퇴
	 public int adminDeleteCustomer(Connection conn, Customer customer) throws Exception {  // 동일한 Connection 사용
		
				int row = 0;

				String sql = "DELETE FROM customer WHERE customer_id = ?";

				PreparedStatement stmt = null;
				try {
					DBUtil dbUtil = new DBUtil();
					conn = dbUtil.getConnection();
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, customer.getCustomerId());
					row = stmt.executeUpdate();
				}finally {
					stmt.close();
				}

				return row;
			
	 
	 
}
	
	
	// 회원 탈퇴
	 public int deleteCustomer(Connection conn, Customer paramCustomer) throws SQLException {  // 동일한 Connection 사용
		// insertOutId와 동일한 conn 사용하므로 conn.close() X
		 int row = 0;
		 String sql =" DELETE FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)";
		 PreparedStatement stmt = null;
		 
		 try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());			
			stmt.setString(2, paramCustomer.getCustomerPass());
			row = stmt.executeUpdate();
			
		 } finally {
			stmt.close();
		 }
 		 
		 return row;

	 }
	
	 

	 // 로그인
	 public Customer selectCustomer(Connection conn, Customer paramcustomer) throws Exception {
			Customer loginCustomer = null;
			
			String sql ="SELECT customer_id customerId,customer_pass customerPass,customer_name customerName FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)";
			PreparedStatement stmt = null;
			ResultSet rset = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, paramcustomer.getCustomerId());
				stmt.setString(2, paramcustomer.getCustomerPass());
				rset = stmt.executeQuery();

				if (rset.next()) {
					loginCustomer = new Customer();
					loginCustomer.setCustomerId(rset.getString("customerId"));
					loginCustomer.setCustomerPass(rset.getString("customerPass"));
					loginCustomer.setCustomerName(rset.getString("customerName"));

				}
			} finally {
				stmt.close();
				rset.close();
			}
			return loginCustomer;
	 }
	 
	// 회원가입
		public int insertCustomer(Connection conn,Customer customer) throws Exception {
			int row =0;
			
			String sql = "insert into customer (customer_id,customer_pass,customer_name,customer_address,customer_telephone,update_date,create_date) values(?,password(?),?,?,?,now(),now())";
			
			
			PreparedStatement stmt = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,customer.getCustomerId());
				stmt.setString(2, customer.getCustomerPass());
				stmt.setString(3, customer.getCustomerName());
				stmt.setString(4, customer.getCustomerAddress());
				stmt.setString(5, customer.getCustomerTelephone());
				
				row= stmt.executeUpdate();
				
			
			}finally {
				if(stmt!=null) {stmt.close();}	
			}
			return row;
		}
		
		
		
		// 회원 active 변경
				public int updateCustomerActive(Connection conn, Customer customer) throws SQLException {
					int row = 0;
					String sql = "UPDATE customer SET active = ? WHERE customer_id = ?";
					PreparedStatement stmt = null;

					try {
						stmt = conn.prepareStatement(sql);
						stmt.setString(1, customer.getActive());
						stmt.setString(2, customer.getCustomerId());
						
						row = stmt.executeUpdate();
					}finally {
						if(stmt!=null) {
							stmt.close();
						}
					}
					return row;
				}
			
		
	//회원 목록
		public ArrayList<Customer> SelectCustomerList(Connection conn, int rowPerPage, int beginRow) throws SQLException  {
			ArrayList<Customer> list = new ArrayList<Customer>();
				

			String sql =" SELECT \r\n"
					+ "		 customer_id,\r\n"
					+ "		 customer_pass,\r\n"
					+ "		 customer_name,\r\n"
					+ "		 customer_address,\r\n"
					+ "		 customer_telephone,\r\n"
					+ "		 update_date,\r\n"
					+ "		 create_date,\r\n"
					+ "		 active\r\n"
					+ "		 FROM customer\r\n"
					+ "		 ORDER BY create_date DESC LIMIT ?, ?";
			
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, beginRow);
				stmt.setInt(2, rowPerPage);
				
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					Customer customer = new Customer();
					customer.setCustomerId(rs.getString("customer_id"));
					customer.setCustomerPass(rs.getString("customer_pass"));
					customer.setCustomerName(rs.getString("customer_name"));
					customer.setCustomerAddress(rs.getString("customer_address"));
					customer.setCustomerTelephone(rs.getString("customer_telephone"));
					customer.setUpdateDate(rs.getString("update_date"));
					customer.setCreateDate(rs.getString("create_date"));
					customer.setActive(rs.getString("active"));
					list.add(customer);
					
					System.out.println("회원목록" + list );
				}
				
			} finally {
				if(rs!=null) {rs.close();}  			
				if(stmt!=null) {stmt.close();}
			}
			return list;
			
		}
		
		public int countAllCustomer(Connection conn) throws Exception {
			int lastPage = 0;
			String sql = "SELECT COUNT(*) cnt FROM customer";
			
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();

				if(rs.next()) {
					lastPage = rs.getInt("cnt");
				}
				
			} finally {
				
				if(rs != null) {
					rs.close();
				}
				
				if(stmt != null) {
					stmt.close();
				}
			}
					
			return lastPage;
		}
		
		
		
		public int CustomerlastPage(Connection conn) throws SQLException {
			int totalCount = 0;
			String sql ="SELECT COUNT(*) FROM customer";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			stmt = conn.prepareStatement(sql); 
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				totalCount= rs.getInt("COUNT(*)"); 
			}
			if(rs != null) { 
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			
			return totalCount;
		}
			
			

		
=======
package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import service.DBUtil;
import vo.Customer;
import vo.Employee;

public class CustomerDao { 
		 
	//관리자 회원 비밀번호초기화
	public int adminUpdateCustomerPw(Connection conn, String customerId) throws Exception {
		
		int row = 0;
		String sql = "UPDATE customer"
				+ " SET customer_pass = PASSWORD(1234)"
				+ " WHERE customer_id = ?";

		PreparedStatement stmt = null;
		try {
			DBUtil dbUtil = new DBUtil();
			conn = dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, customerId);
			row = stmt.executeUpdate();
			System.out.println("row : " + row);

		}finally {
			stmt.close();
			conn.close();
		}

		return row;
	}
	
	//관리자 회원 강제탈퇴
	 public int adminDeleteCustomer(Connection conn, Customer customer) throws Exception {  // 동일한 Connection 사용
		
				int row = 0;

				String sql = "DELETE FROM customer WHERE customer_id = ?";

				PreparedStatement stmt = null;
				try {
					DBUtil dbUtil = new DBUtil();
					conn = dbUtil.getConnection();
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, customer.getCustomerId());
					row = stmt.executeUpdate();
				}finally {
					stmt.close();
				}

				return row;
			
	 
	 
}
	
	
	// 회원 탈퇴
	 public int deleteCustomer(Connection conn, Customer paramCustomer) throws SQLException {  // 동일한 Connection 사용
		// insertOutId와 동일한 conn 사용하므로 conn.close() X
		 int row = 0;
		 String sql =" DELETE FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)";
		 PreparedStatement stmt = null;
		 
		 try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());			
			stmt.setString(2, paramCustomer.getCustomerPass());
			row = stmt.executeUpdate();
			
		 } finally {
			stmt.close();
		 }
 		 
		 return row;

	 }
	
	 

	 // 로그인
	 public Customer selectCustomer(Connection conn, Customer paramcustomer) throws Exception {
			Customer loginCustomer = null;
			
			String sql ="SELECT customer_id customerId,customer_pass customerPass,customer_name customerName FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)";
			PreparedStatement stmt = null;
			ResultSet rset = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, paramcustomer.getCustomerId());
				stmt.setString(2, paramcustomer.getCustomerPass());
				rset = stmt.executeQuery();

				if (rset.next()) {
					loginCustomer = new Customer();
					loginCustomer.setCustomerId(rset.getString("customerId"));
					loginCustomer.setCustomerPass(rset.getString("customerPass"));
					loginCustomer.setCustomerName(rset.getString("customerName"));

				}
			} finally {
				stmt.close();
				rset.close();
			}
			return loginCustomer;
	 }
	 
	// 회원가입
		public int insertCustomer(Connection conn,Customer customer) throws Exception {
			int row =0;
			
			String sql = "insert into customer (customer_id,customer_pass,customer_name,customer_address,customer_telephone,update_date,create_date) values(?,password(?),?,?,?,now(),now())";
			
			
			PreparedStatement stmt = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,customer.getCustomerId());
				stmt.setString(2, customer.getCustomerPass());
				stmt.setString(3, customer.getCustomerName());
				stmt.setString(4, customer.getCustomerAddress());
				stmt.setString(5, customer.getCustomerTelephone());
				
				row= stmt.executeUpdate();
				
			
			}finally {
				if(stmt!=null) {stmt.close();}	
			}
			return row;
		}
		
		
		
		// 회원 active 변경
				public int updateCustomerActive(Connection conn, Customer customer) throws SQLException {
					int row = 0;
					String sql = "UPDATE customer SET active = ? WHERE customer_id = ?";
					PreparedStatement stmt = null;

					try {
						stmt = conn.prepareStatement(sql);
						stmt.setString(1, customer.getActive());
						stmt.setString(2, customer.getCustomerId());
						
						row = stmt.executeUpdate();
					}finally {
						if(stmt!=null) {
							stmt.close();
						}
					}
					return row;
				}
			
		
	//회원 목록
		public ArrayList<Customer> SelectCustomerList(Connection conn, int rowPerPage, int beginRow) throws SQLException  {
			ArrayList<Customer> list = new ArrayList<Customer>();
				

			String sql =" SELECT \r\n"
					+ "		 customer_id,\r\n"
					+ "		 customer_pass,\r\n"
					+ "		 customer_name,\r\n"
					+ "		 customer_address,\r\n"
					+ "		 customer_telephone,\r\n"
					+ "		 update_date,\r\n"
					+ "		 create_date,\r\n"
					+ "		 active\r\n"
					+ "		 FROM customer\r\n"
					+ "		 ORDER BY create_date DESC LIMIT ?, ?";
			
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, beginRow);
				stmt.setInt(2, rowPerPage);
				
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					Customer customer = new Customer();
					customer.setCustomerId(rs.getString("customer_id"));
					customer.setCustomerPass(rs.getString("customer_pass"));
					customer.setCustomerName(rs.getString("customer_name"));
					customer.setCustomerAddress(rs.getString("customer_address"));
					customer.setCustomerTelephone(rs.getString("customer_telephone"));
					customer.setUpdateDate(rs.getString("update_date"));
					customer.setCreateDate(rs.getString("create_date"));
					customer.setActive(rs.getString("active"));
					list.add(customer);
					
					System.out.println("회원목록" + list );
				}
				
			} finally {
				if(rs!=null) {rs.close();}  			
				if(stmt!=null) {stmt.close();}
			}
			return list;
			
		}
		
		public int countAllCustomer(Connection conn) throws Exception {
			int lastPage = 0;
			String sql = "SELECT COUNT(*) cnt FROM customer";
			
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();

				if(rs.next()) {
					lastPage = rs.getInt("cnt");
				}
				
			} finally {
				
				if(rs != null) {
					rs.close();
				}
				
				if(stmt != null) {
					stmt.close();
				}
			}
					
			return lastPage;
		}
		
		
		
		public int CustomerlastPage(Connection conn) throws SQLException {
			int totalCount = 0;
			String sql ="SELECT COUNT(*) FROM customer";
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			stmt = conn.prepareStatement(sql); 
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				totalCount= rs.getInt("COUNT(*)"); 
			}
			if(rs != null) { 
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			
			return totalCount;
		}
			
			

		
>>>>>>> refs/remotes/origin/master
}