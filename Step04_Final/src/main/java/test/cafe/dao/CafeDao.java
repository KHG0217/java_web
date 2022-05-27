package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		if(dao==null) {
			dao=new CafeDao();
		}
		return dao;
	}
	
	//조회수 올리는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "update board_cafe"
					+ " set VIEWCOUNT=VIEWCOUNT+1"
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
	
	//글 하나의 정보를 리턴하는 메소드
	public CafeDto getData(int num) {
		CafeDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "select writer,title,content,viewCount,regdate"
					+ " from board_cafe "
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				
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
	
	//글 하나의 정보를 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "insert into board_cafe"
					+ " (num, writer, title, content, viewCount, regdate) "
					+ " values(board_cafe_seq.nextval,?,?,?,0,sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
	
	//전체 글의 목록을 리턴하는 메소드
	public List<CafeDto> getList(){
		List<CafeDto> list=new ArrayList<CafeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "select num,writer,title,viewCount,regdate"
					+ " from board_cafe"
					+ " order by num desc";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CafeDto dto=new CafeDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				//CafeDto 객체에 참조값을 List 에 누적 시키기
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
		}
		return list;
	}
	
	//페이지 처리 결과에 맞는 row만 select해서 리턴하는 메소드
	public List<CafeDto> getList(CafeDto dto){
		List<CafeDto> list=new ArrayList<CafeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "select *"
					+ " from"
					+ " (select result1.*, rownum as runm"
					+ " from"
					+ " (select num,writer,title,viewCount,regdate"
					+ " from board_Cafe"
					+ " order by num desc) result1)"
					+ " where runm between ? and ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CafeDto dto2=new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				//CafeDto 객체에 참조값을 List 에 누적 시키기
				list.add(dto2);
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
		return list;
	}
	
	//전체 글의 갯수(자료의 갯수)를 리턴하는 메소드
	   public int getCount() {
		   
		   //글의 갯수를 담을 지역변수
		   int count=0;
		   Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "select max(rownum) as count from board_Cafe";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기

			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt("count");
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
		return count;
	  }
	
	//update 메소드
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "update board_cafe"
					+ " set title=?, content=?"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1,dto.getTitle());
			pstmt.setString(2, dto.getContent());
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
	
	//delete 메소드
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "delete from board_cafe"
					+ " where num=? ";
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
	
}