<<<<<<< HEAD
package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import repository.CustomerDao;
import repository.EmployeeDao;
import repository.OutIdDao;
import vo.Customer;
import vo.Employee;
import vo.OutId;

public class CustomerService {

	
	//관리자가 회원 비밀번호 초기화
	public boolean adminUpdateCustomerPw(String customerId){
		Connection conn = null;
		int row = 0;
		try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); 

				CustomerDao customerDao  = new CustomerDao();
				if(customerDao.adminUpdateCustomerPw(conn, customerId)!=1) {
					throw new Exception();
				}
				conn.commit();


			if(row == 0) {
					throw new Exception();
				}
				conn.commit();

			}catch(Exception e){
				e.printStackTrace();
				try {
					conn.rollback();
				}catch(SQLException s) {
					s.printStackTrace();
				}
				return false; 

			}finally {
				try {
					conn.close();
				}catch(SQLException s) {
					s.printStackTrace();
			}


		}
			return true;
		}

	
	
	// 회원탈퇴
	public boolean removeCustomer(Customer paramCustomer) {

		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음

			CustomerDao customerDao = new CustomerDao();
			if (customerDao.deleteCustomer(conn, paramCustomer) != 1) {
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if (OutIdDao.insertOutId(conn, paramCustomer.getCustomerId()) != 1) {

				throw new Exception();
			}

			conn.commit();
		} catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback(); // 1 or 2 실행 시 예외가 발생하면 현재 conn 실행쿼리 모두 롤백
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
	
	//회원 강제 탈퇴
	public boolean adminDeleteCustomer(Customer customer) {
		Connection conn = null;
		try {
		conn = new DBUtil().getConnection();
		conn.setAutoCommit(false); 

		//딜리트
		CustomerDao customerDao  = new CustomerDao();
		if(customerDao.adminDeleteCustomer(conn, customer)!=1) {
			throw new Exception();
		}

		OutIdDao OutIdDao = new OutIdDao();
		if(OutIdDao.insertOutId(conn, customer.getCustomerId()) != 1) {
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

	

	//회원 로그인
	public Customer loginCustomer(Customer paramCustomer) {

		Connection conn = null;
		Customer customer = new Customer();

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			// executeUpdate() 실행 시 자동 커밋을 막음

			CustomerDao customerDao = new CustomerDao();
			customer = customerDao.selectCustomer(conn, paramCustomer);

			conn.commit();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		return customer;

	}
	//회원가입
	public boolean addCustomer(Customer paramCustomer) {
		Connection conn = null;
		
		
		try{
		conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		CustomerDao customerDao= new CustomerDao();
		customerDao.insertCustomer(conn, paramCustomer);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
		
	}

	//회원목록
	public ArrayList<Customer> getCustomerList(int rowPerPage, int currentPage) {

		ArrayList<Customer> list = new ArrayList<Customer>();
		Connection conn = null;
		int beginRow = (currentPage -1 ) * rowPerPage;
		
		
		
		try {
			conn = new DBUtil().getConnection();
			CustomerDao customerDao = new CustomerDao();
			
			list = customerDao.SelectCustomerList(conn, rowPerPage, beginRow);
			
			System.out.println("회원목록" + list);
			
			if(list==null) {
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
			
		return list;
		
	}
	
	// 활동여부
				public boolean modifyCustomerActive(Customer customer) {
					Connection conn = null;
					boolean result = false;
					int row = 0;
					
					try {
						conn = new DBUtil().getConnection();
						conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
						
						CustomerDao customerDao = new CustomerDao();
						row = customerDao.updateCustomerActive(conn, customer);
						
						if(row != 1) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
							throw new Exception();
						} else {
							result = true;
						}		
						conn.commit();		
					} catch (Exception e) {
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
					return result;
				}
		
	
	
	
	//회원마지막페이지
	public int getCustomerLastPage(int rowPerPage) {
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 
			 
			CustomerDao customerDao = new CustomerDao();
			rowPerPage = customerDao.CustomerlastPage(conn);
			System.out.print(rowPerPage +" : rowPerPage");
		
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
}
=======
package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import repository.CustomerDao;
import repository.EmployeeDao;
import repository.OutIdDao;
import vo.Customer;
import vo.Employee;
import vo.OutId;

public class CustomerService {

	
	//관리자가 회원 비밀번호 초기화
	public boolean adminUpdateCustomerPw(String customerId){
		Connection conn = null;
		int row = 0;
		try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); 

				CustomerDao customerDao  = new CustomerDao();
				if(customerDao.adminUpdateCustomerPw(conn, customerId)!=1) {
					throw new Exception();
				}
				conn.commit();


			if(row == 0) {
					throw new Exception();
				}
				conn.commit();

			}catch(Exception e){
				e.printStackTrace();
				try {
					conn.rollback();
				}catch(SQLException s) {
					s.printStackTrace();
				}
				return false; 

			}finally {
				try {
					conn.close();
				}catch(SQLException s) {
					s.printStackTrace();
			}


		}
			return true;
		}

	
	
	// 회원탈퇴
	public boolean removeCustomer(Customer paramCustomer) {

		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음

			CustomerDao customerDao = new CustomerDao();
			if (customerDao.deleteCustomer(conn, paramCustomer) != 1) {
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if (OutIdDao.insertOutId(conn, paramCustomer.getCustomerId()) != 1) {

				throw new Exception();
			}

			conn.commit();
		} catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback(); // 1 or 2 실행 시 예외가 발생하면 현재 conn 실행쿼리 모두 롤백
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
	
	//회원 강제 탈퇴
	public boolean adminDeleteCustomer(Customer customer) {
		Connection conn = null;
		try {
		conn = new DBUtil().getConnection();
		conn.setAutoCommit(false); 

		//딜리트
		CustomerDao customerDao  = new CustomerDao();
		if(customerDao.adminDeleteCustomer(conn, customer)!=1) {
			throw new Exception();
		}

		OutIdDao OutIdDao = new OutIdDao();
		if(OutIdDao.insertOutId(conn, customer.getCustomerId()) != 1) {
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

	

	//회원 로그인
	public Customer loginCustomer(Customer paramCustomer) {

		Connection conn = null;
		Customer customer = new Customer();

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			// executeUpdate() 실행 시 자동 커밋을 막음

			CustomerDao customerDao = new CustomerDao();
			customer = customerDao.selectCustomer(conn, paramCustomer);

			conn.commit();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		return customer;

	}
	//회원가입
	public boolean addCustomer(Customer paramCustomer) {
		Connection conn = null;
		
		
		try{
		conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		CustomerDao customerDao= new CustomerDao();
		customerDao.insertCustomer(conn, paramCustomer);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
		
	}

	//회원목록
	public ArrayList<Customer> getCustomerList(int rowPerPage, int currentPage) {

		ArrayList<Customer> list = new ArrayList<Customer>();
		Connection conn = null;
		int beginRow = (currentPage -1 ) * rowPerPage;
		
		
		
		try {
			conn = new DBUtil().getConnection();
			CustomerDao customerDao = new CustomerDao();
			
			list = customerDao.SelectCustomerList(conn, rowPerPage, beginRow);
			
			System.out.println("회원목록" + list);
			
			if(list==null) {
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
			
		return list;
		
	}
	
	// 활동여부
				public boolean modifyCustomerActive(Customer customer) {
					Connection conn = null;
					boolean result = false;
					int row = 0;
					
					try {
						conn = new DBUtil().getConnection();
						conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
						
						CustomerDao customerDao = new CustomerDao();
						row = customerDao.updateCustomerActive(conn, customer);
						
						if(row != 1) { // 쿼리문이 정상적으로 적용되었는지 확인 후 아닐 시 예외처리
							throw new Exception();
						} else {
							result = true;
						}		
						conn.commit();		
					} catch (Exception e) {
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
					return result;
				}
		
	
	
	
	//회원마지막페이지
	public int getCustomerLastPage(int rowPerPage) {
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 
			 
			CustomerDao customerDao = new CustomerDao();
			rowPerPage = customerDao.CustomerlastPage(conn);
			System.out.print(rowPerPage +" : rowPerPage");
		
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
}
>>>>>>> refs/remotes/origin/master
