package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import my.dto.MyDto;
import my.util.DbcpBean;

public class MyDao {
	public static MyDao dao;
	
	private MyDao() {}
	
	public static MyDao getiInstance() {
		if(dao==null) {
			dao=new MyDao();
		}
		return dao;
	}
	
	public boolean insert(MyDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "insert into do "
					+ " (num,name,work,issue,regdate)"
					+ " values(do_seq.nextval,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1,dto.getName());
			pstmt.setString(2, dto.getWork());
			pstmt.setString(3, dto.getIssue());

			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "delete from do"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setInt(1, num);
			
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public int multiDelete(String[] ck) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				int res = 0;
				int[] cnt =null;
				try {
					conn = new DbcpBean().getConn();
					//실행할 sql 문
					String sql = "delete from do"
							+ " where num=?";
							
					pstmt = conn.prepareStatement(sql);
					//? 에 값 바인딩하기
					for(int i=0; i<ck.length; i++) {
						pstmt.setString(1, ck[i]);
						
						//쿼리문을 pstmt에 모두 쌓아서 한번에 처리
						pstmt.addBatch();
					}
					//모아놓은 쿼리문을 한번에 올릴때 executeBatch
					cnt = pstmt.executeBatch();
					
					//쿼리 성공 -2
					for(int i=0; i<cnt.length; i++) {
						if(cnt[i]==-2) {
							res++;				
						}
					}
					
					if(ck.length==res) {
						conn.commit();
					}else {
						//삭제되지 않으면 롤백
						conn.rollback();
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						pstmt.close();
						conn.close();
					}catch(Exception e) {}
				}
				return res;
	}
	
	public boolean update(MyDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "update do"
					+ " set name=?,work=?,issue=?, regdate=sysdate"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getWork());
			pstmt.setString(3, dto.getIssue());
			pstmt.setInt(4, dto.getNum());
			
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public MyDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyDto dto=null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "select name,work,issue,regdate"
					+ " from do"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new MyDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setWork(rs.getString("work"));
				dto.setIssue(rs.getString("issue"));
				dto.setDate(rs.getString("regdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}return dto;
	}
	
	public List<MyDto> getList(){
		List<MyDto> list = new ArrayList<MyDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "select num,name,work,issue,regdate "
					+ " from do"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MyDto dto=new MyDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setWork(rs.getString("work"));
				dto.setIssue(rs.getString("issue"));
				dto.setDate(rs.getString("regdate"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}return list;
	} 
}


