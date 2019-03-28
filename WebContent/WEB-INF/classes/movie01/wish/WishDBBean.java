package movie01.wish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WishDBBean {
	
	private static WishDBBean instance = new WishDBBean();
	
	public static WishDBBean getInstance(){
		return instance;
	}
	
	public WishDBBean(){}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/movie01");
		return ds.getConnection();
	}
	//wishlist 등록
	public int insertWish(String id,String director,String title,String category){
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String SQL1="SELECT title from wishlist where title=?";
		String SQL2= "INSERT INTO wishlist values(null,?,?,?,?)";
		try{
			conn=getConnection();
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1,title);
			rs = pstmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			if(!rs.next()){
				pstmt = conn.prepareStatement(SQL2);
				pstmt.setString(1,id);
				pstmt.setString(2,director);
				pstmt.setString(3,title);
				pstmt.setString(4,category);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
				
				return 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try{conn.close();}catch(SQLException ex) {}
		}
		return -1;
	}
	
	//위시리스트 내용 유무 파악
	public int getWishlist(String id,int start, int end){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=-1;
		
		try{
			conn=getConnection();
			String sql = "select * from wishlist where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				x=1;
			}else{
				x=0;
				System.out.println("데이터 없음");
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
		//글 목록 출력
	public List<WishDataBean> printWishlist(String id, int start,int end){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WishDataBean> getWishlist = null;
		
		try{
			conn = getConnection();
			String sql = "select * from wishlist where id= ? order by num desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setInt(2,start-1);
			pstmt.setInt(3,end);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				getWishlist = new ArrayList<WishDataBean>(end);
				do{
					WishDataBean article = new WishDataBean();
					article.setId(rs.getString("id"));
					article.setTitle(rs.getString("title"));
					article.setDirector(rs.getString("director"));
					article.setCategory(rs.getString("category"));
					
					getWishlist.add(article);
				}while(rs.next());
				conn.close();
				pstmt.close();
				rs.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		
		return getWishlist;
	}
	
	//wishlist 삭제
	public void deleteWishlist(String title){
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement("delete from wishlist where title=?");
			pstmt.setString(1,title);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
	
	}
}

	

