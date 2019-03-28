package logon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LogonDBBean {
	
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance; 
	}

	private LogonDBBean() {}
	
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/movie01");
		return ds.getConnection();
	}
	
	//회원가입 처리(registerPro.jsp)에서 사용하는 새 레코드 추가메소드
	public void insertM_member(LogonDataBean m_member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();

			pstmt = conn.prepareStatement(
					"insert into m_member value(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, m_member.getId());
			pstmt.setString(2, m_member.getPasswd());
			pstmt.setString(3, m_member.getName());
			pstmt.setString(4, m_member.getMail());
			pstmt.setString(5, m_member.getBirth());
			pstmt.setString(6, m_member.getGender());
			pstmt.setString(7, m_member.getTel());
			pstmt.setTimestamp(8, m_member.getReg_date());
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt !=null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn !=null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	//아이디 찾기
		public String id_search(String mail, String tel) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String id = "";
			
			try {
				conn = getConnection();	
				
				pstmt = conn.prepareStatement(
						"select id from m_member where mail=? and tel=?");
				pstmt.setString(1, mail); 
				pstmt.setString(2, tel);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					 id = rs.getString("id");
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if(pstmt !=null) try {pstmt.close();}catch(SQLException ex) {}
				if(conn !=null) try {conn.close();}catch(SQLException ex) {}
				if(rs != null) try {rs.close();}catch(SQLException ex) {}
			}
			return id;
		}
		
		//비밀번호 찾기
		public String pw_search(String id, String birth) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String passwd = "";
			
			try {
				conn = getConnection();	
				
				pstmt = conn.prepareStatement(
						"select passwd from m_member where id=? and birth=?");
				pstmt.setString(1, id); 
				pstmt.setString(2, birth);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					 passwd = rs.getString("passwd");
				}
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if(pstmt !=null) try {pstmt.close();}catch(SQLException ex) {}
				if(conn !=null) try {conn.close();}catch(SQLException ex) {}
				if(rs != null) try {rs.close();}catch(SQLException ex) {}
			}
			return passwd;
			
		}	
	//로그인 폼 처리(LoginPro.jsp) 페이지의 사용자 인증처리 및 
	//회원 정보 수정/탈퇴를 사용자인증(memberCheck.jsp)에서 사용하는 메소드
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		try {
			
			conn= getConnection();
			
			String pass = passwd;
			
			pstmt = conn.prepareStatement(
					"select passwd from m_member where id = ?");				
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String dbpasswd = rs.getString("passwd");
				if(pass.equals(dbpasswd))
					x=1; //인증성공
				else
					x=0; //비밀번호 틀림
			}else
				x=-1;	//아이디 없음
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		return x;
	}
	
	//아이디 중복확인(confirmId.jsp)에서 아이디의 중복여부를 확인하는 메소드
	public int confirmId(String id) {
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(
					"select id from m_member where id =?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
				if(rs.next()){
					x=1; //같은 아이디 있음
				}else{ 
					x=-1;
				}//같은 아이디 없음
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		return x;
	}
	
	//회원정보 수정 폼 (modifyForm.jsp)를 위한 기존 가입정보를 가져오는 메소드
	public LogonDataBean getM_member(String id) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		LogonDataBean m_member = null;
		
		
		try {
			conn=getConnection();// 커넥션 객체 가져오기
			pstmt = conn.prepareStatement(
					"select * from m_member where id = ?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m_member = new LogonDataBean();
				m_member.setId(rs.getString("id"));
				m_member.setName(rs.getString("name"));
				m_member.setMail(rs.getString("mail"));
				m_member.setBirth(rs.getString("birth"));
				m_member.setGender(rs.getString("gender"));
				m_member.setTel(rs.getString("tel"));
				m_member.setReg_date(rs.getTimestamp("reg_date"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		return m_member;
	}
	
	//회원 정보 수정 처리 (modifyPro.jsp)에서 회원 정보 수정을 처리하는 메소드
	public int updateM_member(LogonDataBean m_member) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int x =-1;
		int cnt = 0;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(
					"SELECT count(*) as cnt FROM M_MEMBER where id=?");
			pstmt.setString(1, m_member.getId());
			rs=pstmt.executeQuery();
			
			if(rs.next()){cnt = rs.getInt("cnt");}
							rs.close();
							pstmt.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		try{
			if(cnt>0) {
				pstmt = conn.prepareStatement(
					"update m_member set passwd=?, name =?, mail=?, birth=?, gender=?, tel=?  where id = ?");
				pstmt.setString(1, m_member.getPasswd());
				pstmt.setString(2, m_member.getName());
				pstmt.setString(3, m_member.getMail());
				pstmt.setString(4, m_member.getBirth());
				pstmt.setString(5, m_member.getGender());
				pstmt.setString(6, m_member.getTel());
				pstmt.setString(7, m_member.getId());
				
				pstmt.executeUpdate();
				pstmt.close();
				x=1;
			} else{
				x=0;
			}
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return x;
	}


	//회원 탈퇴 처리(deletePro.jsp)에서 회원 정보를 삭제하는 메소드
	public int deleteM_member(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x =-1;
		
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(
				"delete from m_member where id =?");
					pstmt.setString(1,id);
					pstmt.executeUpdate();
					x = 1;
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		
	return x;
	}

	////////회원정보관리///////////
	public ArrayList<LogonDataBean> getMemberList(){
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		LogonDataBean member=null;
		
		ArrayList<LogonDataBean> list=new ArrayList<LogonDataBean>();
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from m_member");
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				member=new LogonDataBean(); 
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
				member.setBirth(rs.getString(5));
				member.setGender(rs.getString(6));
				member.setTel(rs.getString(7));
				member.setReg_date(rs.getTimestamp(8));
				
				list.add(member);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		return list;
	}
	
	
	/////////관리자 권한으로 회원정보삭제/////////////
	public int deleteByManager(String id){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=-1;
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from m_member where id=?");
			pstmt.setString(1,id);
			
			pstmt.executeUpdate();
			x=1;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		
		return x;
	}
}
	
