package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import vo.Cart;

public class CartDao {
	
	//장바구니 추가하기
	public int insertCart(Connection conn , Cart cart) throws Exception {
		int row = 0;
		String sql = "INSERT INTO cart"
				+ " (goods_no"
				+ ", customer_id"
				+ ", cart_totalnum"
				+ ", cart_totalprice"
				+ ", update_date"
				+ ", create_date)"
				+ " VALUES(?,?,?,?,NOW(),NOW())";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, cart.getGoodsNo());
			stmt.setString(2, cart.getCustomerId());
			stmt.setInt(3, cart.getCartTotalnum());
			stmt.setInt(4, cart.getCartTotalprice());

			row = stmt.executeUpdate();

		}finally {
			if(stmt!=null) {stmt.close();}
		}

		return row;
	}


	//장바구니 개수 변경하기
		public int updateCart(Connection conn, Cart cart) throws Exception {
			int row = 0;
			String sql = "UPDATE cart"
					+ " SET cart_totalnum = ?"
					+ ", cart_totalprice = ?"
					+ ", update_date = NOW()"
					+ " WHERE goods_no = ?"
					+ " AND customer_id = ?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(sql);

				stmt.setInt(1, cart.getCartTotalnum());
				stmt.setInt(2, cart.getCartTotalprice());
				stmt.setInt(3, cart.getGoodsNo());
				stmt.setString(4, cart.getCustomerId());
				row = stmt.executeUpdate();

				System.out.println(row +" <-- 장바구니 갯수");

			}finally {
				stmt.close();
				conn.close();
			}

			return row;
		}
	
		//장바구니 목록보기
		public ArrayList<Map<String, Object>> selectCartList(Connection conn, String id) throws Exception {
			ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			

			String sql = "SELECT c.goods_no"
					+ "		, g.goods_name"
					+ "		, c.cart_totalnum"
					+ "		, g.goods_price"
					+ "		, c.cart_totalprice"
					+ "		, c.create_date"
					+ "		 FROM cart c INNER JOIN goods g"
					+ "		 ON g.goods_no = c.goods_no"
					+ "		 WHERE customer_id = ?"
					+ "		 ORDER BY c.create_date DESC";

			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement(sql);

				stmt.setString(1, id);

				rs = stmt.executeQuery();

				System.out.println(stmt + " <-- stmt");

				if(rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("goodsNo", rs.getInt("goods_no"));
					map.put("goodsName", rs.getString("goods_name"));
					map.put("cartTotalnum", rs.getInt("cart_totalnum"));
					map.put("goodsPrice", rs.getInt("goods_price"));
					map.put("cartTotalprice", rs.getInt("cart_totalprice"));

					list.add(map);

				}
			}finally {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
			}

			

			return list;
		}


}
