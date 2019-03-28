package magazine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BbsMagazine {
	
	private static BbsMagazine instance = new BbsMagazine();
	
	public static BbsMagazine getInstance() {
		return instance;
	}
	
	private BbsMagazine() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/movie01");
		return ds.getConnection();
	}
	
	//main_body에  magazine 최근 작성 글 5개 출력
	public ArrayList<Bbs> getMagazineCont(int bbsID, String bbsTitle, String bbsContent) {
		
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Bbs bbs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement
					("select bbsID, bbsTitle, bbsContent from bbs "
							+ "order by bbsDate desc limit 3");
			rs=pstmt.executeQuery();

			while(rs.next()) {
				bbs=new Bbs();
				bbs.setBbsID(rs.getInt("BbsID"));
				bbs.setBbsTitle(rs.getString("BbsTitle"));
				bbs.setBbsContent(rs.getString("BbsContent"));
				
				list.add(bbs);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException ex){}
			if(pstmt != null)try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)try {conn.close();}catch(SQLException ex) {}
		}
		return list;
		
	}

}
