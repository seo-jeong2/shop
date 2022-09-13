<<<<<<< HEAD
package service;

import vo.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import repository.*;

public class NoticeService {
	
	public boolean adminDeleteNotice(int noticeNo) {
		Connection conn = null;
		try {
		conn = new DBUtil().getConnection();
		conn.setAutoCommit(false); 

		//딜리트
		NoticeDao noticeDao  = new NoticeDao();
		if(noticeDao.deleteNotice(noticeNo) !=1) {
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
			return false; //탈퇴실패

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return true;
	}
	
	//공지 입력
	public boolean addNotice(Notice notice) {
		
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); //자동 커밋방지

			//딜리트
			NoticeDao noticeDao  = new NoticeDao();
			if(noticeDao.insertNotice(conn, notice)==0) {
				throw new Exception();
			}
			conn.commit();

		}catch(Exception e) {
			e.printStackTrace(); //console에 예외메세지 출력
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

	
	//공지 상세보기
	public Notice getNoticeOne(int noticeNo){
		Notice notice = null;
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			System.out.println(conn + ": 공지상세보기");

			NoticeDao noticeDao = new NoticeDao();

			notice = noticeDao.selectNoticeOne(conn, noticeNo);

			if(notice == null) {
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

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return notice;
	}
	
	
	
	
	//공지 목록
	public ArrayList<Notice> getNoticeListByPage(int rowPerPage, int currentPage){
		ArrayList<Notice> list = new ArrayList<Notice>();

		Connection conn = null;

		System.out.println(currentPage + " <-- currentPage");
		int beginRow = (currentPage-1) * rowPerPage;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);			// 자동 커밋 막아줌

			NoticeDao noticeDao = new NoticeDao();

			System.out.println(beginRow + " <-- beginRow");

			list = noticeDao.selectNoticeList(conn, rowPerPage, beginRow);

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

	//마지막페이지
	public int getLastPage(int rowPerPage) {
		
		Connection conn = null;
		int totalCount = 0;
		int lastPage = 0;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			NoticeDao noticeDao = new NoticeDao();
			totalCount = noticeDao.lastPage(conn);


			lastPage = totalCount/rowPerPage;

			if(totalCount % rowPerPage != 0) {
				lastPage +=1;
				//안나눠 떨어지면 더해줌
			}

			System.out.println(rowPerPage + " <-- rowPerPage");

	     if(rowPerPage == 0) {	// 실패시 예외처리
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
	      return lastPage;
	}
}


=======
package service;

import vo.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import repository.*;

public class NoticeService {
	
	public boolean adminDeleteNotice(int noticeNo) {
		Connection conn = null;
		try {
		conn = new DBUtil().getConnection();
		conn.setAutoCommit(false); 

		//딜리트
		NoticeDao noticeDao  = new NoticeDao();
		if(noticeDao.deleteNotice(noticeNo) !=1) {
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
			return false; //탈퇴실패

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return true;
	}
	
	//공지 입력
	public boolean addNotice(Notice notice) {
		
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); //자동 커밋방지

			//딜리트
			NoticeDao noticeDao  = new NoticeDao();
			if(noticeDao.insertNotice(conn, notice)==0) {
				throw new Exception();
			}
			conn.commit();

		}catch(Exception e) {
			e.printStackTrace(); //console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false; //탈퇴실패

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return true;
	}

	
	//공지 상세보기
	public Notice getNoticeOne(int noticeNo){
		Notice notice = null;
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			System.out.println(conn + ": 공지상세보기");

			NoticeDao noticeDao = new NoticeDao();

			notice = noticeDao.selectNoticeOne(conn, noticeNo);

			if(notice == null) {
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

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return notice;
	}
	
	
	
	
	//공지 목록
	public ArrayList<Notice> getNoticeListByPage(int rowPerPage, int currentPage){
		ArrayList<Notice> list = new ArrayList<Notice>();

		Connection conn = null;

		System.out.println(currentPage + " <-- currentPage");
		int beginRow = (currentPage-1) * rowPerPage;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);			// 자동 커밋 막아줌

			NoticeDao noticeDao = new NoticeDao();

			System.out.println(beginRow + " <-- beginRow");

			list = noticeDao.selectNoticeList(conn, rowPerPage, beginRow);

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

	//마지막페이지
	public int getLastPage(int rowPerPage) {
		
		Connection conn = null;
		int totalCount = 0;
		int lastPage = 0;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			NoticeDao noticeDao = new NoticeDao();
			totalCount = noticeDao.lastPage(conn);


			lastPage = totalCount/rowPerPage;

			if(totalCount % rowPerPage != 0) {
				lastPage +=1;
				//안나눠 떨어지면 더해줌
			}

			System.out.println(rowPerPage + " <-- rowPerPage");

	     if(rowPerPage == 0) {	// 실패시 예외처리
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
	      return lastPage;
	}
}


>>>>>>> refs/remotes/origin/master
