package movie01.directory;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie01.directory.DirDataBean;

public class DirDBBean_Ani {
	
	private static DirDBBean_Ani instance = new DirDBBean_Ani();
	
	
	public static DirDBBean_Ani getInstance(){
		return instance;
		}
	
	public DirDBBean_Ani() {}
	//데이터 커넥션 설정
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/movie01");
		return ds.getConnection();
	}
	
	//영화 리스트 번호
	public int getNextAni() {
		PreparedStatement pstmt = null;
		Connection conn =null;
		ResultSet rs = null;

		try{
			String sql = "SELECT movieID FROM animation ORDER BY movieID DESC";
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1) +1;
			}
			return 1; // 첫번째 게시물
		}catch(Exception e){
			e.printStackTrace();
			return -1; //DB 오류
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){} 
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
			if(conn != null) try{conn.close();}catch(SQLException ex){}
		}
	}
	
	//영화 리스트 출력
	public ArrayList<DirDataBean> getMovieListAni(int pageNumber,String category) {
		
		ArrayList<DirDataBean> list = new ArrayList<DirDataBean>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //결과 값 
		DirDataBean moviedir = null;
		String sql = null;
		
		try{
			sql = "SELECT movieID,poster,title FROM animation where movieID < ? ORDER BY movieid DESC LIMIT 8";
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  getNextAni()- (pageNumber -1) * 8);
			rs=pstmt.executeQuery();
			
		}catch(Exception e){
			e.printStackTrace();
			}
		try{
			while(rs.next()){
				moviedir = new DirDataBean();
				moviedir.setMovieID(rs.getInt("movieID"));
				moviedir.setPoster(rs.getString("poster"));
				moviedir.setTitle(rs.getString("title"));
				list.add(moviedir);

			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){} 
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
			if(conn != null) try{conn.close();}catch(SQLException ex){}
		}
		return list;
	}
	
	//영화 상세페이지 출력
	public DirDataBean getMoviedetailAni(int movieId){
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //결과 값 
		DirDataBean moviedir = null;
		
		try{
			conn=getConnection();
			pstmt = conn.prepareStatement(
					"SELECT * FROM animation WHERE movieID= ?");
			pstmt.setInt(1, movieId);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				moviedir = new DirDataBean();
				moviedir.setMovieID(rs.getInt(1));
				moviedir.setPoster(rs.getString(2));
				moviedir.setTitle(rs.getString(3));
				moviedir.setDirector(rs.getString(4));
				moviedir.setActor(rs.getString(5));
				moviedir.setStory(rs.getString(6));
				moviedir.setCategory(rs.getString(7));
				return moviedir;
			}else{
				System.out.println("No data");
				
			}
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();}catch(SQLException ex){}
		}

		return moviedir;
	}
	
	// 페이징 처리
	public boolean nextPageAni(int pageNumber){
		ArrayList<DirDataBean> list = new ArrayList<DirDataBean>();
		String sql = "SELECT * FROM animation WHERE movieID <?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;


		try{
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNextAni()-(pageNumber -1) * 8);
			rs= pstmt.executeQuery();
			
			if (rs.next()){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(conn != null) try {conn.close();}catch(SQLException ex){}
		}
		return false;
		
	}
	/*               영화 관리자 페이지                   */
	// 영화 리스트
	public ArrayList<DirDataBean> adminMovieListAni(int pageNumber) {
		
		ArrayList<DirDataBean> list = new ArrayList<DirDataBean>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //결과 값 
		DirDataBean moviedir = null;
		String sql = null;
		
		try{
			sql = "SELECT * FROM animation where movieID < ? ORDER BY movieid DESC LIMIT 15";
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  getNextAni()- (pageNumber -1) * 15);
			rs=pstmt.executeQuery();
			
		}catch(Exception e){
			e.printStackTrace();
			}
		try{
			while(rs.next()){
				moviedir = new DirDataBean();
				moviedir.setMovieID(rs.getInt("movieID"));
				moviedir.setPoster(rs.getString("poster"));
				moviedir.setTitle(rs.getString("title"));
				moviedir.setDirector(rs.getString("director"));
				moviedir.setActor(rs.getString("actor"));
				moviedir.setStory(rs.getString("story"));
				list.add(moviedir);

			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){} 
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
			if(conn != null) try{conn.close();}catch(SQLException ex){}
		}
		return list;
	}
	
	//영화 등록
	public int movieWriteAni(String poster, String title, String director,String actor, String story) {
		Connection conn = null;
		String SQL="INSERT INTO animation VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			conn=getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNextAni());
			pstmt.setString(2, poster);
			pstmt.setString(3, title);
			pstmt.setString(4, director);
			pstmt.setString(5, actor);
			pstmt.setString(6, story);
			pstmt.setString(7,"animation");
		
			pstmt.executeUpdate();
			
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		 return -1; //데이터베이스 오류
	}
	
	//영화 삭제
	public int movieDeleteAni(int movieID){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=-1;
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from animation where movieid=?");
			pstmt.setInt(1,movieID);
			
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
	
	//수정 페이지에서 기존 내용 출력
	public DirDataBean getmovieAni(int movieID) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String SQL="SELECT * FROM animation WHERE movieID = ?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,movieID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				DirDataBean article = new DirDataBean();
				article.setMovieID(rs.getInt(1));
				article.setPoster(rs.getString(2));
				article.setTitle(rs.getString(3));
				article.setDirector(rs.getString(4));
				article.setActor(rs.getString(5));
				article.setStory(rs.getString(6));
				return article;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		 return null;
		
	}
	//영화 내용 수정
	public int updateMovieAni(int movieID, String title, String director, String actor, String poster, String story) {
		String SQL1 = "SELECT count(*) as cnt FROM animation where movieID=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnt=0;
		int x = -1;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(SQL1);
			pstmt.setInt(1,movieID);
			rs=pstmt.executeQuery();
			
			if(rs.next()){cnt = rs.getInt("cnt");}	
				rs.close();
				pstmt.close();
				conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		try{
			if(cnt>0){
		
				String SQL2="UPDATE animation SET title=?, director=?, actor=?, poster=?, story=? WHERE movieID =?";
				conn=getConnection();
				pstmt=conn.prepareStatement(SQL2);
				pstmt.setString(1, title);
				pstmt.setString(2, director);
				pstmt.setString(3, actor);
				pstmt.setString(4, poster);
				pstmt.setString(5, story);
				pstmt.setInt(6, movieID);
				pstmt.executeUpdate();
				
				x=1;
				
				pstmt.close();
				conn.close();
			}else
				x=0;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		 return x; //데이터베이스 오류
	}
	/*          메인페이지 출력        */	
	//영화 컨텐츠 랜덤 출력
	public ArrayList<DirDataBean> getBodyDirCont(int movieID, String poster, String title, String category, String story) {
	
	   ArrayList<DirDataBean> bdclist = new ArrayList<DirDataBean>();
	   
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   DirDataBean moviedir=null;
	      
	   try {
	      conn=getConnection();
	      pstmt=conn.prepareStatement("select * from animation order by rand() limit 10");
	      rs=pstmt.executeQuery();
	      
	      while(rs.next()) {
	         moviedir=new DirDataBean();
	         moviedir.setMovieID(rs.getInt("MovieID"));
	         moviedir.setPoster(rs.getString("Poster"));
	         moviedir.setTitle(rs.getString("Title"));
	         moviedir.setCategory(rs.getString("Category"));
	         moviedir.setStory(rs.getString("Story"));
	         
	         bdclist.add(moviedir);
	      }
	
	
	   } catch(Exception e) {
	      e.printStackTrace();
	   } finally {
	      if(rs != null) try {rs.close();}catch(SQLException ex){}
	      if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
	      if(conn != null)try {conn.close();}catch(SQLException ex) {}
	   }
	   return bdclist;
	}
}
