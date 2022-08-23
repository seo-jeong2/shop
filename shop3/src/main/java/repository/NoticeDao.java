package repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import repository.*;
import vo.*;


public class NoticeDao {
	
	// 공지 삭제
		public int deleteNotice(int noticeNo) throws ClassNotFoundException, SQLException {
			
			String sql = "delete from notice where notice_no=?";
			Connection conn = null;
			PreparedStatement stmt = null;
			int row = 0;
			
			try {
				
				
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, noticeNo);
				row = stmt.executeUpdate();
				
			} finally {

				stmt.close();
				conn.close(); 
			}
				
			return row;
		}
		
	
	
	
	
	//공지 입력
	public int insertNotice(Connection conn, Notice notice) throws Exception {
		int row = 0;
		String sql  = "INSERT INTO notice"
				+ " (notice_title"
				+ ", notice_id"
				+ ", notice_content"
				+ ", update_date"
				+ ", create_date)"
				+ " VALUES(?,?,NOW(),NOW())";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, notice.getNoticeNo());
			stmt.setString(2, notice.getNoticeTitle());
			stmt.setString(3, notice.getNoticeContent());
			stmt.setString(4, notice.getNoticeId());
			
			
			System.out.println(stmt + " :stmt");
			row  = stmt.executeUpdate();
		}finally {
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}			
		}
		System.out.println(row + " row" );
		return row;
	}
	
	
	// 공지 수정 update
		public int updateNotice(Connection conn, Notice notice) throws ClassNotFoundException, SQLException {
			int row = 0;
			String sql = "update notice set notice_title=?, notice_content=? where notice_no=?;";
		
			PreparedStatement stmt = null;
			
			
			try {
				
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, notice.getNoticeTitle());
				stmt.setString(2, notice.getNoticeContent());
				stmt.setInt(3,notice.getNoticeNo());
				row = stmt.executeUpdate();
				
				System.out.println("row: " + row);
				
			} finally {

				
				stmt.close();
				conn.close(); 
			}
			
			
			
			return row;
			
		}
	
	
	
	//공지 상세보기
	public Notice selectNoticeOne(Connection conn, int noticeNo) throws Exception {
		
		Notice notice = null;

		String sql = "SELECT notice_no"
				+ ", notice_title"
				+ ", notice_content"
				+ ", notice_id"
				+ ", update_date"
				+ ", create_date"
				+ " FROM notice"
				+ " WHERE notice_no = ?";

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeNo);

			System.out.println(stmt + " <-- 공지 : 상세보기");

			rs = stmt.executeQuery();

			if(rs.next()) {
				notice = new Notice();
				notice.setNoticeNo(rs.getInt("notice_no"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setNoticeId(rs.getString("notice_id"));
				notice.setUpdateDate(rs.getString("update_date"));
				notice.setCreateDate(rs.getString("create_date"));
			}

		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}
		}

		
		System.out.println(notice +"공지상세보기");

		return notice;
	}
	
	
	//공지목록
	public ArrayList<Notice> selectNoticeList(Connection conn, int rowPerPage, int beginRow) throws Exception {

		ArrayList<Notice> list = new ArrayList<Notice>();

		String sql = "SELECT notice_no"
				+ ", notice_title"
				+ ", notice_content"
				+ ", notice_id"
				+ ", update_date"
				+ ", create_date"
				+ " FROM notice"
				+ " LIMIT ?,?";

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);

			rs = stmt.executeQuery();

			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeNo(rs.getInt("notice_no"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setNoticeId(rs.getString("notice_id"));
				notice.setUpdateDate(rs.getString("update_date"));
				notice.setCreateDate(rs.getString("create_date"));

				list.add(notice);
			}
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}			
		}

		return list;
	}

	//마지막 페이지
	public int lastPage(Connection conn) throws Exception {

		String sql = "SELECT COUNT(*) FROM notice";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalCount = 0;


		stmt = conn.prepareStatement(sql);
	    rs = stmt.executeQuery();

		 if(rs.next()) {
	            totalCount = rs.getInt("COUNT(*)");
	         }

		 if(rs!=null) {rs.close();}
		 if(stmt!=null) {stmt.close();}

		return totalCount;
	}
}


