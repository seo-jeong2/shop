package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import vo.Goods;

public class GoodsDao {

	// 고객 상품리스트 보기
	public List<Map<String, Object>> selectCustomerGoodsListByPage(Connection conn, int rowPerPage, int beginRow,
			int num) throws SQLException {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "";

		if (num == 1) {

			sql = "		SELECT g.goods_no goodsNo" + "             , g.goods_name goodsName"
					+ "             , g.goods_price goodsPrice" + "             , gi.filename filename" + "       FROM"
					+ "       goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum"
					+ "                      FROM orders\r\n" + "                      GROUP BY goods_no) t"
					+ "                      ON g.goods_no = t.goods_no"
					+ "                         INNER JOIN goods_img gi"
					+ "                         ON g.goods_no = gi.goods_no"
					+ "							WHERE g.sold_out = 'N'"
					+ "       ORDER BY IFNULL(t.sumNUm, 0) DESC LIMIT ?, ?";
		}

		if (num == 0) {
			sql = "SELECT  g.goods_no goodsNo" + "		, g.goods_name goodsName" + "		, g.goods_price goodsPrice"
					+ "		, g.update_date updateDate" + "		, g.create_date createDate"
					+ "		, g.sold_out soldOut" + "		, i.filename fileName"
					+ "		, i.origin_filename originalFilename" + "		, i.content_type contentType"
					+ "		, i.create_date iCreateDate" + "		 from  goods g INNER JOIN goods_img i"
					+ "		  ON g.goods_no = i.goods_no" + "			WHERE g.sold_out = 'N'"
					+ "		  ORDER BY g.goods_no LIMIT ?, ?";

		}

		stmt = conn.prepareStatement(sql);

		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);

		rs = stmt.executeQuery();

		while (rs.next()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("goodsNo", rs.getInt("goodsNo"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("goodsPrice", rs.getInt("goodsPrice"));
			map.put("soldOut", rs.getString("soldOut"));
			map.put("fileName", rs.getString("fileName"));

			list.add(map);
		}

		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		return list;
	}

	// 상품등록
	public int insertGoods(Connection conn, Goods goods) throws Exception {

		int goodsNo = 0;
		String sql = "insert into goods(goods_name, goods_price, sold_out, update_date, create_date)"
				+ " values (?, ?, ?, now(), now())";

		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());

		stmt.executeUpdate(); // insert
		ResultSet rs = stmt.getGeneratedKeys(); // return 값

		if (rs.next()) {
			goodsNo = rs.getInt(1);
			System.out.println("상품 추가하기 " + goodsNo);
			// getGeneratedKeys가 반환하는 컬럼명을 알 순 없지만
			// 첫번째라는 것은 알 수 있으므로 rs.getInt(1)
		}

		if (rs != null) {
			rs.close();
		}

		if (stmt != null) {
			stmt.close();
		}

		return goodsNo;
	}

	// 상품수정
	public int updateGoods(Connection conn, Goods goods, int goodsNo) throws SQLException {
		int row = 0;
		String sql = "UPDATE goods SET goods_name = ? , goods_price = ? , sold_out = ? WHERE goods_no = ?";
		PreparedStatement stmt = null;
		System.out.println(goodsNo);

		stmt = conn.prepareStatement(sql);
		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());
		stmt.setString(3, goods.getSoldOut());
		stmt.setInt(4, goodsNo);

		System.out.println("stmt" + stmt);

		row = stmt.executeUpdate();
		// 디버깅
		System.out.println("row: " + row);

		if (stmt != null) {

			stmt.close();
		}

		return row;
	}

	// 상품 soldout 변경
	public int updateGoodsSoldOut(Connection conn, Goods goods) throws SQLException {
		int row = 0;
		String sql = "UPDATE goods SET sold_out = ? WHERE goods_no = ?";
		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, goods.getSoldOut());
			stmt.setInt(2, goods.getGoodsNo());

			row = stmt.executeUpdate();
		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}
		return row;
	}

	// 상품 상세보기 사진
	public Map<String, Object> selectGoodsAndImgOne(Connection conn, int goodsNo) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "SELECT  g.goods_no goodsNo, g.goods_name goodsName, g.goods_price goodsPrice, g.update_date updateDate, g.create_date createDate, g.sold_out soldOut, i.filename fileName, i.origin_filename originalFilename, i.content_type contentType, i.create_date CreateDate from  goods g INNER JOIN goods_img i ON g.goods_no = i.goods_no WHERE g.goods_no=?";
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, goodsNo);
			rs = stmt.executeQuery();

			while (rs.next()) {

				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("goodsUpdateDate", rs.getString("updateDate"));
				map.put("goodsCreateDate", rs.getString("createDate"));
				map.put("soldOut", rs.getString("soldOut"));
				map.put("imgFileName", rs.getString("fileName"));
				map.put("imgOriginFileName", rs.getString("originalFilename"));
				map.put("imgContentType", rs.getString("contentType"));
				map.put("imgCreateDate", rs.getString("createDate"));

			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}
		return map;
	}

	// 상품 목록 페이지
	public List<Goods> selectGoodsListByPage(Connection conn, int rowPerPage, int beginRow) throws SQLException {

		List<Goods> list = new ArrayList<Goods>();

		String sql = "SELECT goods_no goodsNo, goods_name goodsName, goods_price goodsPrice, update_date updateDate, create_date createDate, sold_out soldOut FROM goods ORDER BY goods_no DESC limit ?,?";
		PreparedStatement stmt = null;
		ResultSet rset = null;

//		 SELECT goods_no goodsNo FROM goods ORDER BY goods_no DESC LIMIT ?,?

		try {

			list = new ArrayList<Goods>();

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rset = stmt.executeQuery();

			while (rset.next()) {
				Goods goods = new Goods();
				goods.setGoodsNo(rset.getInt("goodsNo"));
				goods.setGoodsName(rset.getString("goodsName"));
				goods.setGoodsPrice(rset.getInt("goodsPrice"));
				goods.setUpdateDate(rset.getString("updateDate"));
				goods.setCreateDate(rset.getString("createDate"));
				goods.setSoldOut(rset.getString("soldOut"));

				list.add(goods);

			}

		} finally {
			rset.close();
			stmt.close();
		}
		return list;
	}

	// 상품 마지막 페이지
	public int lastPage(Connection conn) throws SQLException {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) From goods";
		PreparedStatement stmt = null;
		ResultSet rs = null;

		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();

		if (rs.next()) {
			totalCount = rs.getInt("count(*)");
		}

		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}

		return totalCount;
	}

}
