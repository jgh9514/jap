package event;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int count;
	public UserDAO(){
		 try{
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 String jdbcDriver = "jdbc:sqlserver://ms1201.gabiadb.com:1433;DatabaseName=jghdb";
			 String dbUser = "jgh9514";
			 String dbPass = "jgh15963@@";
			 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			 //비번 제대로 입력 했습니다. 
			 } catch(Exception e){
			   e.printStackTrace();
			 }
		count = count()+1;
	}

	public int count(){
		String SQL = "SELECT COUNT(*) FROM [dbo].[event_data]";
		try{
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt(1);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 15;
	}
	
	public int date_count(String date1,String date2){
		String SQL = "SELECT COUNT(*) FROM [dbo].[event_data] where editDate > ? AND editDate < ?";
		try{
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, date1);
		pstmt.setString(2, date2);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt(1);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public int time_count(String date1,int date2){
		String SQL = "SELECT COUNT(*) FROM [dbo].[event_data] where editDate >= ? AND editDate <= ?";
		String pt1,pt2;
		try{
		pstmt = conn.prepareStatement(SQL);
		if(date2 < 10) {
			pt1 = date1 + " 0"+ date2 +":00:00.000";
			pt2 = date1 + " 0"+ date2 +":59:59.000";
		}
		else {
			pt1 = date1 + " "+ date2 +":00:00.000";
			pt2 = date1 + " "+ date2 +":59:59.000";
		}
		pstmt.setString(1, pt1);
		pstmt.setString(2, pt2);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt(1);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public int count_Part(String Part){
		String SQL = "SELECT count(*) FROM [dbo].[event_data] where userPart=?";
		try{
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, Part);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt(1);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 15;
	}
	
	public ArrayList<User> getList(int pageNumber, int device){
		String SQL = "SELECT * FROM [dbo].[event_data] where count > ? AND count <= ? order by count DESC offset 0rows";
		ArrayList<User> list = new ArrayList<User>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			if (device== 1) {
				pstmt.setInt(1,  count-(pageNumber-1)*10-10);
			}
			else if (device== 2) {
				pstmt.setInt(1,  count-(pageNumber-1)*10-9);
			}
			else if (device== 3) {
				pstmt.setInt(1,  0);
				pstmt.setInt(2,  count);
			}
			else return list;
			
			pstmt.setInt(2,  count-(pageNumber-1)*10);
			
			
				
			rs = pstmt.executeQuery();
			while (rs.next()){
				User user = new User();
				user.setCount(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserPhone(rs.getString(3));
				user.setUserAge(rs.getString(4));
				user.setUserGender(rs.getString(5));
				user.setUserPart(rs.getString(6));
				user.setUserType(rs.getString(7));
				user.setEditDate(rs.getString(8));
				user.setConnection_device(rs.getString(9));
				user.setReferer(rs.getString(10));
				list.add(user);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	
	public ArrayList<User> getMemberList(String Ord_default, String Sort_default, String Rows_default, int Page_default){
		ArrayList<User> list = new ArrayList<User>();
		int offset = Integer.parseInt(Rows_default) * Page_default;
		String SQL = "SELECT * FROM [dbo].[event_data] order by " + Ord_default + " " + Sort_default + " offset " + offset + " rows fetch next " + Rows_default  + " row only";
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()){
				User user = new User();
				user.setCount(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserPhone(rs.getString(3));
				user.setUserAge(rs.getString(4));
				user.setUserGender(rs.getString(5));
				user.setUserPart(rs.getString(6));
				user.setUserType(rs.getString(7));
				user.setEditDate(rs.getString(8));
				user.setConnection_device(rs.getString(9));
				user.setReferer(rs.getString(10));
				list.add(user);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int Event_Participation(User event) {
		String SQL = "INSERT INTO [dbo].[event_data] VALUES (?, ?, ?, ?, ?, ?, ?,CONVERT(VARCHAR(25),GETDATE(),120), ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,count);
			pstmt.setString(2, event.getUserName());
			pstmt.setString(3, event.getUserPhone());
			pstmt.setString(4, event.getUserAge());
			pstmt.setString(5, event.getUserGender());
			pstmt.setString(6, event.getUserPart());
			pstmt.setString(7, event.getUserType());
			pstmt.setString(8, event.getConnection_device());
			pstmt.setString(9, event.getReferer());
			return pstmt.executeUpdate();
		} catch (Exception e){
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
	}
}
