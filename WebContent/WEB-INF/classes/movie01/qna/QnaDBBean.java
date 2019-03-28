package movie01.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnaDBBean {
	
	private static QnaDBBean instance= new QnaDBBean();
	
	//DBBean접근시 필요
	public static QnaDBBean getInstance(){
		return instance;
	}
	
	public QnaDBBean(){}
	
	//커넥션 풀
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/movie01");
		return ds.getConnection();
	}
		
	//테이블에 글 추가
	public int insertArticle(QnaDataBean article){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0 ;
		int number = 0; // 글번호
		String sql = "";
		
		//댓글 정보
		int num= article.getNum(); // 제목글 글번호
		int ref = article.getRef(); //그룹화 아이디
		int re_step=article.getRe_step(); // 그룹 내 글의 순서
		int re_level=article.getRe_level(); // 글제목의 들여쓰기
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from qna");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				number = rs.getInt(1)+1;
			else
				number = 1;
			
			if(num!=0){ // 댓글
				sql = "update qna set re_step = re_step+1 where ref = ? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step= re_step+1;
				re_level = re_level+1;
			}else{ //본문
				ref =number;
				re_step = 0 ;
				re_level = 0;
			}
			//쿼리 작성
			sql="insert into qna(id,subject,content,reg_date,ip,ref,re_step,re_level) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getContent());
			pstmt.setTimestamp(4, article.getReg_date());
			pstmt.setString(5, article.getIp());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.executeUpdate();
			x=1;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	
	//전체 글의 수
	public int getArticleCount(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x =0;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from qna");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt(1);
			}	
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	//글 목록
	public List<QnaDataBean> getArticles(int start,int end){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaDataBean> articleList = null;
		
		try{
			conn = getConnection();
			String sql = "select * from qna order by ref desc,re_step asc, num desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,start-1);
			pstmt.setInt(2,end);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				articleList = new ArrayList<QnaDataBean>(end);
				do{
					QnaDataBean article = new QnaDataBean();
					article.setNum(rs.getInt("num"));
					article.setId(rs.getString("id"));
					article.setSubject(rs.getString("subject"));
					article.setContent(rs.getString("content"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
				}while(rs.next());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return articleList;
	}
	
	//글 내용
	public QnaDataBean updateGetArticle(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnaDataBean article = null;
		try{
			conn = getConnection();

			String sql = "select * from qna where num =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				article = new QnaDataBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setSubject(rs.getString("subject"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return article;
	}
	
	//글 수정
	public int updateArticle(QnaDataBean article){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try{
			conn = getConnection();
			System.out.println(article.getId());
			String sql1 = "select id from qna where num=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String sessionId = rs.getString("id");
				if(sessionId.equals(article.getId())){
					String sql2 = "update qna set subject=?, content= ? where num=?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, article.getSubject());
					pstmt.setString(2, article.getContent());
					pstmt.setInt(3, article.getNum());
					pstmt.executeUpdate();
					x=1;
				}else
					x=0;
			}else{
				System.out.println("데이터 조회 실패");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
	return x;
	}
//삭제
	public int deleteArticle(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try{
			if(true){
			conn = getConnection();
			String sql = "delete from qna where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
				x=1;
			}else
				x=0;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	//main페이지에 상위 게시물 2개 노출
	public ArrayList<QnaDataBean> getQnaCont(int num, String Subject, String Content) {
	        
	  ArrayList<QnaDataBean> qdblist = new ArrayList<QnaDataBean>();
	  Connection conn=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  QnaDataBean qdb=null;
	     
	   try {
	      conn=getConnection();
	      pstmt=conn.prepareStatement("select num, subject, Content from qna where id <> 'admin' order by num desc limit 2");
	      rs=pstmt.executeQuery();
	        
	      while(rs.next()) {
	          qdb=new QnaDataBean();
	          qdb.setNum(rs.getInt("Num"));
	          qdb.setSubject(rs.getString("Subject"));
	          qdb.setContent(rs.getString("Content"));
	          
	          qdblist.add(qdb);
	       }
	    } catch(Exception e) {
	       e.printStackTrace();
	    } finally {
	       if(rs != null) try {rs.close();}catch(SQLException ex){}
	       if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
	       if(conn != null)try {conn.close();}catch(SQLException ex) {}
	    }
	    return qdblist;
	     
	}
}
