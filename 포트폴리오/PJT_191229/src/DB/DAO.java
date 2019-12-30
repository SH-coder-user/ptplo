package DB;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.util.ArrayList;
	import java.util.List;

import DB.DBCon;
import DB.DTO;

	public class DAO {

		public static DTO readDB(int bno) {
		
			DTO board = new DTO();
			Connection con = null;
			PreparedStatement ps= null;
			ResultSet rs = null;
			String sql  = "select * from tbl where bno = ?";
			
			try {
				con = DBCon.getCon();
				ps =con.prepareStatement(sql);
				ps.setInt(1, bno);
				rs=ps.executeQuery();
					if(rs.next()) {
						board.setBno(rs.getInt("bno"));
						board.setTitle(rs.getString("title"));
						String content =rs.getString("content");
						board.setCnt(rs.getInt("cnt"));
						board.setContent(content);
						board.setWriter(rs.getString("writer"));
						board.setRegdate(rs.getDate("regdate"));
						board.setUpdatedate(rs.getDate("updatedate"));
					}
					return board;
			}catch(Exception e){
				e.printStackTrace();
		}
			return board;
		}
		public static List<DTO> readDBList(int pageNo){
			List<DTO> list =  new ArrayList<DTO>();
			Connection con =null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			int pageLine = 5;
			int end =pageNo* pageLine;
			int start = end - pageLine+1;
			String sql = "select b.* from(select rownum rn, a.* from(select * from tbl order by bno desc)a)b where b.rn between "+start+" and "+end;
			try {
				con= DBCon.getCon();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					DTO board = new DTO();
					board.setBno(rs.getInt("bno"));
					board.setTitle(rs.getString("title"));
					board.setWriter(rs.getString("writer"));
					board.setRegdate(rs.getDate("regdate"));
					board.setUpdatedate(rs.getDate("updatedate"));
					board.setCnt(rs.getInt("cnt"));
					list.add(board);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		public static int totalCnt() {
			int cnt = 0;
			
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String sql = "select count(bno) from tbl";
			
			try {
				con = DBCon.getCon();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt(1);
				}else {
					cnt=0;
				}
			}catch(Exception e) {
				e.printStackTrace();
				}
		
			return cnt;
		
	}
		
		public static int maxCnt() {
			int cnt = 0;
			
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			String sql= "select max(bno) from tbl";
			
			try {
				con = DBCon.getCon();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt(1);
				}
				}catch(Exception e) {
					e.printStackTrace();
					}
			
				return cnt;
				}
			public static int insertDB2(DTO board) {
				int result = -1;
				
				Connection con = null;
				PreparedStatement ps = null;
				
				String sql = "insert into tbl(bno, title, content, writer)"
						+ "values(?, ?, ?, ?)";
				
				try {
					con = DBCon.getCon();
					ps = con.prepareStatement(sql);
					ps.setInt(1, board.getBno());
					ps.setString(2, board.getTitle());
					ps.setString(3, board.getContent());
					ps.setString(4, board.getWriter());
					result = ps.executeUpdate();
									
				}catch(Exception e) {
					e.printStackTrace();
				}
				return result;
			}
			public static int deleteDB(int bno) {
				int result = -1;
				
				Connection con = null;
				PreparedStatement ps= null;
				
				String sql = "delete tbl where bno=?";
				
				try {
					con = DBCon.getCon();
					ps=con.prepareStatement(sql);
					ps.setInt(1, bno);
					result = ps.executeUpdate();			
				}catch(Exception e){
					e.printStackTrace();
				}
				return result;
			}
			
			public static int updateDB2(DTO board) {
				
				int result = -1;
				
				Connection con = null;
				PreparedStatement ps= null;
				
				String sql = "update tbl set title=?, content=?,"
						+ "updatedate =sysdate where bno =?";
				
				try {
					con = DBCon.getCon();
					ps = con.prepareStatement(sql);
					ps.setString(1, board.getTitle());
					ps.setString(2, board.getContent());
					ps.setInt(3, board.getBno());
					ps.executeUpdate();
					result = ps.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return result;
				
			}
		public static void cntDB(int bno) {
				
				Connection con = null;
				PreparedStatement ps = null;
				
				
					String sql = "update tbl set cnt=cnt+1 where bno=?";
				
				try {
					con = DBCon.getCon();
					ps = con.prepareStatement(sql);
					ps.setInt(1, bno);
					
					ps.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	

		

		public static DTO readDB(String userid) {
			DTO user=new DTO();
			Connection con = null;
			PreparedStatement ps= null;
			ResultSet rs = null;
			String sql = "select *from userinfo where id = ?";
			try {
				con = DBCon.getCon();
				ps = con.prepareStatement(sql);
				ps.setString(1,userid);
				rs = ps.executeQuery();
				if(rs.next()) {
					user.setName(rs.getString("name"));
					user.setId(rs.getString("id"));
					user.setPassword(rs.getString("password"));
					user.setTel(rs.getString("tel"));
					user.setJob(rs.getString("job"));
					user.setGender(rs.getInt("gender"));
					user.setHobby(rs.getString("hobby"));
					user.setIntro(rs.getString("intro"));
					
				}else {
					user.setId(null);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DBCon.close(con, ps, rs);
			}
			return user;
			}
		
	
	public static int deleteDB(String userid) {
			int result = -1;
			
			Connection con =null;
			PreparedStatement ps = null;
			
			String sql ="delete userinfo where id=?";
			
			try {
				con = DBCon.getCon();
				ps= con.prepareStatement(sql);
				ps.setString(1, userid);
				result = ps.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DBCon.close(con,ps,null);
			}
			return result;
		}
		
		
	public static List<DTO> readDBList(){
			List<DTO> list = new ArrayList<DTO>();
			Connection con =null;
			PreparedStatement ps =null;
			ResultSet rs= null;
			String sql = "select * from userinfo";
			try {
				con= DBCon.getCon();
				ps= con.prepareStatement(sql);
				rs= ps.executeQuery();
				while(rs.next()) {
					DTO user = new DTO();
					user.setName(rs.getString("name"));
					user.setId(rs.getString("id"));
					user.setPassword(rs.getString("password"));
					user.setTel(rs.getString("tel"));
					user.setJob(rs.getString("job"));
					user.setGender(rs.getInt("gender"));
					user.setHobby(rs.getString("hobby"));
					user.setIntro(rs.getString("intro"));
					list.add(user);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBCon.close(con, ps, rs);
			}
			return list;
	}

	
		public static int updateDB(DTO user) {
		
			Connection con = null;
			PreparedStatement ps= null;
			int result = -1;
			
			String sql = "update userinfo set password,tel,job,hobby from userinfo where id = ?";
			try {
				con = DBCon.getCon();
				ps= con.prepareStatement(sql);
				
				ps.setString(1, user.getPassword());
				ps.setString(2, user.getTel());
				ps.setString(3, user.getJob());
				ps.setString(4, user.getHobby());
				result = ps.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DBCon.close(con,ps,null);
			}
			return result;
		}
		
	
		public static int insertDB(DTO user) {
			int result = -1;
			Connection con = null;
			PreparedStatement ps = null;
			
			String sql = "insert into userinfo(name, id, password, tel, job, gender, hobby, intro) values(?, ?, ?, ?, ?, ?, ?, ?)";
			
			try {
				con = DBCon.getCon();
				ps = con.prepareStatement(sql);
				ps.setString(1, user.getName());
				ps.setString(2, user.getId());
				ps.setString(3, user.getPassword());
				ps.setString(4, user.getTel());
				ps.setString(5, user.getJob());
				ps.setInt(6, user.getGender());
				ps.setString(7, user.getHobby());
				ps.setString(8, user.getIntro());
				result = ps.executeUpdate();
								
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBCon.close(con,ps,null);
			}
			
			return result;
		}
		

		
	
		public static DTO readbook(String bcd) {
			DTO user=null;
			
			Connection con = null;
			PreparedStatement ps= null;
			ResultSet rs = null;
			String sql = "select * from book where bcd = '"+bcd+"'";
			try {
				con = DBCon.getCon();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {
					user=new DTO();
					user.setBcd(rs.getString("bcd"));
					user.setFcd(rs.getString("fcd"));
					user.setTitle(rs.getString("title"));
					user.setWriter(rs.getString("writer"));
					user.setPublish(rs.getString("publish"));
					user.setPrice(rs.getString("price"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DBCon.close(con, ps, rs);
			}
			return user;
			}
}
