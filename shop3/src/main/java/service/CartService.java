package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import repository.CartDao;
import vo.Cart;

public class CartService {
	
	
	//장바구니 추가
	public boolean insertCart(Cart cart) {
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 

			
			CartDao cartDao  = new CartDao();
			if(cartDao.insertCart(conn, cart)!=1) {
				throw new Exception();
			}
			conn.commit();

		}catch(Exception e) {
			e.printStackTrace(); 
			try {
				conn.rollback();
			} catch (SQLException e1) { 

				e1.printStackTrace();
			}
			return false; 

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return true;
	}

	//장바구니 상세보기
		public List<Map<String, Object>> getCartListOne(String id){
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			CartDao cartDao = null;
			Connection conn = null;

			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);			// 자동 커밋 막아줌

				cartDao = new CartDao();

				list = cartDao.selectCartList(conn, id);

				// 디버깅
				System.out.println("list : " + list);

				if(list==null) {	
					throw new Exception();
				}

				conn.commit();

			} catch(Exception e) {
				e.printStackTrace();
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}

			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
			
			return list;
		}
		


}


