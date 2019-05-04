package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int count;
	public UserDAO(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String jdbcDriver = "jdbc:sqlserver://ms1201.gabiadb.com:1433;DatabaseName=jghdb";
			String dbUser = "jgh9514";
			String dbPass = "jgh15963@@";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	 	} catch(Exception e){
	 		e.printStackTrace();
	 	}
	}

	public int count(){
		String SQL = "SELECT COUNT(*) FROM [dbo].[jap.user]";
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
	

	/*로그인 함수*/
	public int login_check(String userID, String userPassword){
		
		String SQL = "SELECT userPassword FROM [dbo].[jap.user] WHERE userId = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword))
					return 1; //성공
				else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디가 없음
		} catch (Exception e){
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	/*로그인 함수*/
	
	/*회원가입 아이디 중복체크 함수*/
	public int id_check(String userID) {
		String SQL = "SELECT COUNT(*) FROM [dbo].[jap.user] WHERE userId = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*회원가입 아이디 중복체크 함수*/

	/*회원가입 핸드폰번호 중복체크 함수 START*/
	public int mobile_check(String userMobile) {
		String SQL = "SELECT COUNT(*) FROM [dbo].[jap.user] WHERE userPhone = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userMobile);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	/*회원가입 핸드폰번호 중복체크 함수 END*/

	/*회원가입 데이터 insert 함수*/
	
	public int join(UserDTO user_data) {
		String SQL = "INSERT INTO [dbo].[jap.user] VALUES (?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_data.getRegist_date());
			pstmt.setString(2, user_data.getUserId());
			pstmt.setString(3, user_data.getUserPassword());
			pstmt.setString(4, user_data.getUserName());
			pstmt.setString(5, user_data.getUserDate());
			pstmt.setString(6, user_data.getUserGender());
			pstmt.setString(7, user_data.getUserEmail());
			pstmt.setString(8, user_data.getUserPhone());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	/*회원가입 데이터 insert 함수*/

	public ArrayList<UserDTO> getMemberList(String Ord_default, String Sort_default, String Rows_default, int Page_default){
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		int offset = Integer.parseInt(Rows_default) * Page_default;
		String SQL = "SELECT * FROM [dbo].[jap.user] order by " + Ord_default + " " + Sort_default + " offset " + offset + " rows fetch next " + Rows_default  + " row only";
		
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()){
				UserDTO user_data = new UserDTO();
				user_data.setRegist_date(rs.getString(1));
				user_data.setUserId(rs.getString(2));
				user_data.setUserPassword(rs.getString(3));
				user_data.setUserName(rs.getString(4));
				user_data.setUserDate(rs.getString(5));
				user_data.setUserGender(rs.getString(6));
				user_data.setUserEmail(rs.getString(7));
				user_data.setUserPhone(rs.getString(8));
				list.add(user_data);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int user_delete(String SQL) {
		try{
			pstmt = conn.prepareStatement(SQL);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
