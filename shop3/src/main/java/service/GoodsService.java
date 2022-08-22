package service;

import java.sql.*;

import java.util.*;
import repository.*;
import vo.*;


// 서비스가 하는 일: 트랜잭션 처리 ★★★★★★★ + action, Dao가 해서는 안되는 일 처리
public class GoodsService {

	private GoodsImgDao goodsImgDao ;
	private GoodsDao goodsDao;
	
		
	//상품 수정 (이미지포함)
	public int modifyGoods(Goods goods, GoodsImg goodsImg, int goodsNo) throws Exception{
		Connection conn = null;
		int row = 0;
		System.out.println(goodsNo);
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
			
			GoodsDao goodsDao = new GoodsDao();
			GoodsImgDao goodsImgDao= new GoodsImgDao();
			row = goodsDao.updateGoods(conn, goods, goodsNo);
			
			if(row ==0) {
			throw new Exception();
			}
			
			System.out.println(goodsNo + ": goodsNo");

			
			if(row != 0) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
			System.out.println("상품수정 성공");
			goodsImg.setGoodsNo(goodsNo);
			
			if(goodsImgDao.updateGoodsImg(conn, goodsNo, goodsImg) ==0) { //상품이미지 수정
				throw new Exception();
			}
				
			
		} 
			conn.commit();
			
		}
			catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback(); // 예외를 던지지말고 감싸야함
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
		System.out.println("GoodsService 성공");
		return goodsNo;
	}
		
	


	//상품추가
	public int addGoods(Goods goods, GoodsImg goodsImg) {
		int goodsNo = 0;
		Connection conn = null;
		
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			this.goodsDao = new GoodsDao();
			
			goodsNo = goodsDao.insertGoods(conn, goods);
			// 방금 insert한 goods_no 리턴 -> action의 redirection에 씀

			System.out.println(goodsNo  +" : 상품추가하기 ");
			
			if(goodsNo != 0) { // goods insert에 성공한 경우
				goodsImg.setGoodsNo(goodsNo);
				this.goodsImgDao = new GoodsImgDao(); // 모든 메소드에서 쓰는 dao가 아니므로
				
				if(goodsImgDao.insertGoodsImg(conn, goodsImg) == 0) {
					goodsNo = 0; // 실패 시 goodsNo 다시 0
					System.out.println("goodsImgDao.insertGoods: " + goodsNo);

					throw new Exception();
					// 이미지 입력 실패 시 catch 절로 이동 -> rollBack
				}
			}
			
			conn.commit();
			
		} catch (Exception e) {
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
		
		return goodsNo;
	}
	
	//이미지 상세보기
	public Map<String, Object> getGoodsAndImgOne(int goodsNo) {
		Map<String,Object> map = null;
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			GoodsDao goodsDao = new GoodsDao(); 	
			map = goodsDao.selectGoodsAndImgOne(conn, goodsNo);
			
			
			System.out.print("상품 상세보기 : " + map);
			conn.commit();
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	
	
	// 상품 품절 변경
		public boolean modifyGoodsSoldOut(Goods goods) {
			Connection conn = null;
			boolean result = false;
			int row = 0;
			
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
				
				this.goodsDao = new GoodsDao();	
				row = goodsDao.updateGoodsSoldOut(conn, goods);
				
				if(row != 1) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
					throw new Exception();
				} else {
					result = true;
				}		
				conn.commit();		
			} catch (Exception e) {
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
			return result;
		}
	
		
	//마지막 페이지
		public int getLastPage(int rowPerPage) {
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 
			 
			GoodsDao goodsDao = new GoodsDao(); 
			rowPerPage = goodsDao.lastPage(conn);
			
			conn.commit();
		} 
		
		catch (Exception e) {
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

	//상품목록
	public List<Goods> getGoodsListByPage(int rowPerPage, int currentPage) {

		Connection conn = null;
		int beginRow = (currentPage - 1) * rowPerPage;

		List<Goods> list = new ArrayList<Goods>();
		this.goodsDao = new GoodsDao();

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			list = goodsDao.selectGoodsListByPage(conn, rowPerPage, beginRow);

		} catch (Exception e) {
			
			e.printStackTrace();
			
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
