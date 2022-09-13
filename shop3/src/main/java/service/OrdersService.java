package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import repository.GoodsDao;
import repository.OrdersDao;
import vo.Orders;

public class OrdersService {

	// 관리자 고객주문확인 상세보기
	public Map<String, Object> getOrdersOne(int goodsNo) {
		Map<String, Object> m = null;
		Connection conn = null;
			
		try {
			conn = new DBUtil().getConnection(); // 디비연동
			conn.setAutoCommit(false); //자동커밋방지	
			
			OrdersDao ordersDao = new OrdersDao();
			
			m = ordersDao.selectOrdersOne(conn, goodsNo);
			System.out.println(m  + " : 상품 상세보기");
			
			if(m ==null ) {
				throw new Exception();
			}
			conn.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	
	
	//관리자의 고객주문확인의 페이징
	public int getOrderListByPageLastPage(int rowPerPage) {
		Connection conn =null;
		
		
		try {
			conn = new DBUtil().getConnection(); // 디비연동
			conn.setAutoCommit(false); //자동커밋방지	
			
			OrdersDao ordersDao = new OrdersDao();
			rowPerPage = ordersDao.OrderslastPage(conn, rowPerPage);
			
			System.out.print(rowPerPage +" rowPerPage");
			
			if(rowPerPage ==0 ) {
				throw new Exception();
			}
			conn.commit();			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return rowPerPage;
		
		
	}
	
	
	// 관리자의 고객주문확인
	public List<Map<String, Object>> getOrdersListByEmployee (int rowPerPage, int currentPage) {
		List<Map<String, Object>> list  = new ArrayList<>();
		
		Connection conn = null;
		OrdersDao ordersDao = new OrdersDao();
		
		try {
			conn = new DBUtil().getConnection(); 
			
			conn.setAutoCommit(false); 
			
			
			System.out.println(ordersDao);
			
			list = ordersDao.selectOrdersList(conn, currentPage, rowPerPage);
			
			System.out.println(list);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return list;
		
	}
	
	
	// 고객의 셀프주문확인의 페이징용
	public int getcustomerGoodsListByPageLastPage(int rowPerPage) {
		Connection conn=null;
		
		try {
			conn = new DBUtil().getConnection(); // 디비연동
			conn.setAutoCommit(false); //자동커밋방지	
			
			// GoodsDao goodsDao = new GoodsDao();
			OrdersDao ordersDao = new OrdersDao();
			rowPerPage = ordersDao.OrderslastPage(conn, rowPerPage);
			
			System.out.print(rowPerPage +" : rowPerPage");
			
			
			if(rowPerPage ==0 ) {
				throw new Exception();
			}
			conn.commit();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return rowPerPage;
	}
	
	
	// 고객 주문확인
	public List<Map<String, Object>> getOrdersListByCustomer (String customerId, final int rowPerPage, int currentPage) {
		
		List<Map<String, Object>> m = new ArrayList<>();
		
		Connection conn = null;
		int beginRow = 0;	
		beginRow = (currentPage -1 ) * rowPerPage;
		
		try {
			conn = new DBUtil().getConnection();
			OrdersDao ordersDao = new OrdersDao();
			
			m = ordersDao.selectOrdersListByCustomer(conn, customerId, rowPerPage, beginRow);
			System.out.println(m +": m");
			
			if(m ==null ) {
				throw new Exception();
			}
			
			conn.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return m;
		
	}
	
	
}