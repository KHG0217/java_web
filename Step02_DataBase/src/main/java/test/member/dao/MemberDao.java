package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
/*
 * 	Connection 객체 얻어오는 방법
 * 
 * 	Connection conn=new DbcpBean().getConn();
 */
import test.util.DbcpBean;
/*
 * 	Web Servr Applicaion에서 DB연동을 하기 위해 Connection 객체를 얻어와야 하는데
 * 	
 * 	해당 작업은 DB에 원격접속을 해서 계정과 비밀번호를 전달하고 인증을 받아야하는 작업이기 떄문에
 * 
 * 	시간이 다소(1초이내) 소요되는 무거운 작업이다.
 * 
 * 	따라서 Connection 객체를 미리 여러개 만들어 놓고 필요한 곳에서 잠시 사용하고
 *                                           필요한 곳에서 new DbcpBean().getConn()
 * 
 * 	닫아버리는 것이 아니라, 다시 반납하는 구조로 사용 할 필요가 있다.
 *                          conn.close()
 * 
 * 	그렇게 사용하는 방법은
 * 
 * 	tomcat.apache.org 사이트에서 설정하라는 데로 하면된다. (3가지 방법)
 * 
 * 	이게 바로 Data Base Connection Pool Bean의 개념이다.
 *                                    객체
 *            풀장에 Connection 콩(객체)를 둥둥 띄어놓은 개념
 * 
 */


//Application 전역에서 MemberDao 객체는 오직 하나만 생성되도록 만들기
public class MemberDao {
	//자신의 참조값을 저장할 static 필드
	private static MemberDao dao;
	
	//외부에서 객체를 생성하지 못하도록 막기
	private MemberDao() {}
	
	
	//자신의 참조값을 리턴해주는 public static 메소드 만들기
	public static MemberDao getInstance() {
		//최초 호출될때는 dao가 null이다.
		if(dao==null) {
			//객체를 생성해서 static 필드에 담아 놓는다.
			dao=new MemberDao();
		}
		//static 필드에 있는 참조값을 리턴해 준다.
		return dao;
	}
		
		
	//회원 한명의 정보를 수정하고 성공여부를 리턴하는 메소드
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "update member "
					+ " set name=?,addr=? "
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
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
	//회원 한명의 정보를 삭제하고 성공 여부를 리턴하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "delete from member "
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
	
	
	//회원 한명의 정보를 추가하고 성공 여부를 리턴하는 메소드
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql="insert into member "
					+ " (num,name,addr)"
					+ " values(member_seq.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
	//전체 회원 목록을 리턴하는 메소드
	public List<MemberDto> getlist(){
		List<MemberDto> dtoList = new ArrayList<MemberDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		//Select니까
		ResultSet rs=null;
		try {
			//Connection Pool에서 Connection 객체 하나 받아오기
			conn=new DbcpBean().getConn();
			//select문의 뼈대 구성
			String sql="Select num,name,addr from member"
					+ " order by num asc";
			pstmt=conn.prepareStatement(sql);
			//?에 값 바인딩 할것이 있으면 하기
			
			//sql문 수행하고 ResultSet 객체 얻어내기
			rs=pstmt.executeQuery();
			//반복문 돌면서 리턴할 list의 값 담기
			while(rs.next()) {
				MemberDto dtoData = new MemberDto();
				dtoData.setNum(rs.getInt("num"));
				dtoData.setName(rs.getString("name"));
				dtoData.setAddr(rs.getString("addr"));
				dtoList.add(dtoData);
					
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
				rs.close();
				if(pstmt!=null)
				pstmt.close();
				if(conn!=null)
				conn.close(); //Connection 객체를 Connection pool객체 반납하기
			}catch(Exception e) {}
		}
		return dtoList;
	}
	
	//회원 한명의 정보를 리턴하는 메소드
	   //회원 한명의 정보를 리턴하는 메소드
	   public MemberDto getData(int num) {
	      
	      MemberDto dto=null;
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT name, addr"
	               + " FROM member"
	               + " WHERE num=?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         pstmt.setInt(1, num);
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         //만일 select 된 row 가 있으면 커서를 한칸 내려서 
	         if (rs.next()) {
	            //커서가 위치한 곳의 회원 정보를 MemberDto 객체를 생성해서 담는다.
	            dto=new MemberDto();
	            dto.setNum(num);
	            dto.setName(rs.getString("name"));
	            dto.setAddr(rs.getString("addr"));
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
	      }
	      return dto;
	   }
	   
	
}
