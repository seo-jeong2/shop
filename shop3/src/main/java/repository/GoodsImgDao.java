package repository;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBUtil;
import vo.GoodsImg;

public class GoodsImgDao {

	//이미지 삽입
	public int insertGoodsImg(Connection conn, GoodsImg goodsImg) throws SQLException{
		int row = 0;
		
		
		PreparedStatement stmt = null;
		String sql = "INSERT INTO goods_img (goods_no, filename, origin_filename, content_type, create_date) VALUES (?, ?, ?, ?, NOW())";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, goodsImg.getGoodsNo());
			stmt.setString(2, goodsImg.getFileName());
			stmt.setString(3, goodsImg.getOriginFileName());
			stmt.setString(4, goodsImg.getContentType());
			System.out.println(stmt + "<--stmt - insertGoodsImg");
			// 실행
			row = stmt.executeUpdate();
			
			
		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}
		
		System.out.println(row + ":  이미지등록");
		return row;
	}

	//이미지 수정
	public int updateGoodsImg(Connection conn, int goodsNo, GoodsImg goodsImg) throws Exception {
		
		int row = 0;
		String sql ="UPDATE goods_img SET filename=?, content_type=?, origin_filename=? WHERE goods_no=?";
		
		PreparedStatement stmt = null;
		
		
		try {
			DBUtil dbUtil = new DBUtil();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, goodsImg.getFileName());
			stmt.setString(2, goodsImg.getOriginFileName());
			stmt.setString(3, goodsImg.getContentType());
			stmt.setInt(4, goodsNo);
			
			System.out.println(stmt + ": 이미지수정");
			row = stmt.executeUpdate();
			
			
		} finally {
			stmt.close();
			
		}
		
		System.out.println(row + " : 이미지수정 성공");
		return row ;
	}
	
	
	
	public GoodsImg selectImgOne(int goodsNo)  throws Exception {
	      GoodsImg img = null;
	      String sql = "SELECT goods_no goodsNo, origin_filename OriginFileName, filename FileName FROM goods_img  WHERE goods_no = ?";
	      Connection conn = null;
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	      try {
	         DBUtil dbUtil = new DBUtil();
	         conn = dbUtil.getConnection();
	         stmt = conn.prepareStatement(sql);
	         stmt.setInt(1, goodsNo);
	         rs = stmt.executeQuery();
	         if(rs.next()) {
	            img = new GoodsImg();
	            img.setGoodsNo(rs.getInt("goodsNo"));
	            img.setOriginFileName(rs.getString("originFileName"));
	            img.setFileName(rs.getString("fileName"));
	            
	         }
	      } finally {
	         rs.close();
	         stmt.close();
	         conn.close();
	      }
	      return img;
	   }
	
}
		
		
		
		
		
		