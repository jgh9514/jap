package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import SQL_Contact.Connetion;





public class Board_DAO {
	
	Connetion DB_Contact = new Connetion(); //SQL 패키지에서 DB접속 데이터 받기 위해 호출.

	public Connection conn = DB_Contact.conn; //DB접속에 대한 정보를 받아온다.
	public PreparedStatement pstmt;
	public ResultSet rs;
	int count;
	

	public String getboard_name(String board_id){
		String SQL = "SELECT board_name FROM [dbo].[jap.board] where board_id=" + board_id;
		try{
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getString(1);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "error";
	}

	/*게시판 게시글 리스트 획득 함수 START*/
	public ArrayList<Board_DTO> Get_Board_Data(){
		ArrayList<Board_DTO> list = new ArrayList<Board_DTO>();
		String SQL = "SELECT * FROM [dbo].[jap.board]";
		
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Board_DTO post_data = new Board_DTO();
				post_data.setBoard_id(rs.getInt(1));
				post_data.setBoard_use(rs.getInt(2));
				post_data.setBoard_name(rs.getString(3));
				post_data.setBoard_list_view_count(rs.getInt(4));
				post_data.setBoard_list_count(rs.getInt(5));
				post_data.setBoard_sort(rs.getString(6));
				
				list.add(post_data);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	/*게시판 게시글 리스트 획득 함수 END*/
	
}
