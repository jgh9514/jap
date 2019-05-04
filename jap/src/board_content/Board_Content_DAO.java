package board_content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import SQL_Contact.Connetion;
import paging.Paging;


public class Board_Content_DAO {
	
	Connetion DB_Contact = new Connetion(); //SQL 패키지에서 DB접속 데이터 받기 위해 호출.

	public Connection conn = DB_Contact.conn; //DB접속에 대한 정보를 받아온다.
	public PreparedStatement pstmt;
	public ResultSet rs;
	int count;
	
	/*jap.board_content 테이블에 row개수를 얻는 함수 START*/
	public int count(){
		String SQL = "SELECT COUNT(*) FROM [dbo].[jap.board_content]";
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	/*jap.board_content 테이블에 row개수를 얻는 함수 END*/
	

	/*jap.board_content 테이블에 row개수를 얻는 함수(조건문) START*/
	public int count(String where_query){
		String SQL = "SELECT COUNT(*) FROM [dbo].[jap.board_content] where board_id = " + where_query;
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	/*jap.board_content 테이블에 row개수를 얻는 함수(조건문) END*/
	
	
	/*게시판 게시글 insert 함수 START*/
	public int Content_Insert(Board_Content_DTO content_data) {
		String SQL = "INSERT INTO [dbo].[jap.board_content] VALUES (?,?,?,?,?,CONVERT(VARCHAR(25),GETDATE(),120),?,?)";
		count = count()+1;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, content_data.getBoard_id());
			pstmt.setString(2, content_data.getTitle());
			pstmt.setString(3, content_data.getContents());
			pstmt.setInt(4, count);
			pstmt.setString(5, content_data.getUserId());
			pstmt.setInt(6, content_data.getHit_count());
			pstmt.setInt(7, content_data.getVote_count());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	/*게시판 게시글 insert 함수 END*/


	/*게시판 게시글 update 함수 START*/
	public int Content_Update(Board_Content_DTO content_data) {
		String SQL = "UPDATE [dbo].[jap.board_content] SET title=?, contents=? WHERE bcode=? AND board_id=?";
		count = count()+1;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, content_data.getTitle());
			pstmt.setString(2, content_data.getContents());
			pstmt.setInt(3, content_data.getBcode());
			pstmt.setInt(4, content_data.getBoard_id());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	/*게시판 게시글 update 함수 END*/
	

	/*게시판 게시글 조회수 증가 함수 START*/
	public int Content_Hit_Count_Up(String board_no, String bcode){
		String SQL = "UPDATE [dbo].[jap.board_content] SET hit_count= ((SELECT hit_count FROM [dbo].[jap.board_content] WHERE bcode=? AND board_id=? ) + 1) WHERE bcode=? AND board_id=?";
		count = count()+1;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bcode);
			pstmt.setString(2, board_no);
			pstmt.setString(3, bcode);
			pstmt.setString(4, board_no);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	/*게시판 게시글 조회수 증가 함수 END*/
	
	
	/*게시판 게시글 리스트 획득 함수 START*/
	public ArrayList<Board_Content_DTO> getPostList(int board_id, String Ord_default, String Sort_default, String Rows_default, int Page_default){
		ArrayList<Board_Content_DTO> list = new ArrayList<Board_Content_DTO>();
		int offset = Integer.parseInt(Rows_default) * Page_default;
		String where_if = "";
		if(board_id != 0){
			where_if = "where board_id = " + board_id;
		}
		String SQL = "SELECT * FROM [dbo].[jap.board_content] " + where_if + " order by " + Ord_default + " " + Sort_default + " offset " + offset + " rows fetch next " + Rows_default  + " row only";
		
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Board_Content_DTO post_data = new Board_Content_DTO();
				post_data.setBoard_id(rs.getInt(1));
				post_data.setTitle(rs.getString(2));
				post_data.setContents(rs.getString(3));
				post_data.setBcode(rs.getInt(4));
				post_data.setUserId(rs.getString(5));
				post_data.setBdate(rs.getString(6));
				post_data.setHit_count(rs.getInt(7));
				post_data.setVote_count(rs.getInt(8));
				list.add(post_data);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	/*게시판 게시글 리스트 획득 함수 END*/
	
	/*게시글 상세보기 페이지 다른글보기 리스트 함수 START*/
	public ArrayList<Board_Content_DTO> Board_List_Read(int board_id, String Ord_default, String Sort_default, String Rows_default, int Page_default, int bcode){
		ArrayList<Board_Content_DTO> list = new ArrayList<Board_Content_DTO>();
		int offset = Integer.parseInt(Rows_default) * Page_default;
		String where_if = "";
		int start_count = bcode-2;
		int end_count = bcode+2;
		
		if(bcode < 3){
			start_count = 1;
			end_count = 5;
		}else if(end_count > count()-2){
			start_count = count()-5;
			end_count = count()-1;
			
		}
		
		if(board_id != 0){
			where_if = "where board_id = " + board_id + " AND bcode >= " + start_count + " AND bcode <= " + end_count;
		}
		String SQL = "SELECT * FROM [dbo].[jap.board_content] " + where_if + " order by " + Ord_default + " " + Sort_default + " offset " + offset + " rows fetch next " + Rows_default  + " row only";
		
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Board_Content_DTO post_data = new Board_Content_DTO();
				post_data.setBoard_id(rs.getInt(1));
				post_data.setTitle(rs.getString(2));
				post_data.setContents(rs.getString(3));
				post_data.setBcode(rs.getInt(4));
				post_data.setUserId(rs.getString(5));
				post_data.setBdate(rs.getString(6));
				post_data.setHit_count(rs.getInt(7));
				post_data.setVote_count(rs.getInt(8));
				list.add(post_data);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	/*게시글 상세보기 페이지 다른글보기 리스트 함수 END*/
	
	
	/*게시글 상세보기 정보 획득 함수 START*/
	public Board_Content_DTO Get_Board_Content(String board_no, String bcode){
		String SQL = "SELECT * FROM [dbo].[jap.board_content] where Board_id = " + board_no + " AND bcode = " + bcode;

		Board_Content_DTO post_data = new Board_Content_DTO();
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()){
				post_data.setBoard_id(rs.getInt(1));
				post_data.setTitle(rs.getString(2));
				post_data.setContents(rs.getString(3));
				post_data.setBcode(rs.getInt(4));
				post_data.setUserId(rs.getString(5));
				post_data.setBdate(rs.getString(6));
				post_data.setHit_count(rs.getInt(7));
				post_data.setVote_count(rs.getInt(8));
			}
			Content_Hit_Count_Up(board_no, bcode);
		} catch (Exception e){
			e.printStackTrace();
		}
		return post_data;
	}
	/*게시글 상세보기 정보 획득 함수 END*/
	

    public int page_count(String Rows_default, String board_id) {
    	int total;
    	if(board_id == null){
    		total = count();
    	}else{
    		total = count(board_id);
    	}
    	int row = Integer.parseInt(Rows_default);
    	int lastPageNum = 0;
    	if( total % row == 0 ) {
    		lastPageNum = (int)Math.floor(total/row);
    	}
    	else {
    		lastPageNum = (int)Math.floor(total/row) + 1;
    	}
    	return lastPageNum;
    }

	public Paging page_list(String Rows_default, String board_id, int Page_default){
		Paging page = new Paging();
		int blockNum = 0;
		int PageCount = 5;
    	int total;
    	if(board_id == null){
    		total = count();
    	}else{
    		total = count(board_id);
    	}
		int row = Integer.parseInt(Rows_default);
	    int last_page = (int)Math.ceil((double)total/row);
	    
		blockNum = (int)Math.floor((Page_default-1)/ PageCount) + 1;
		page.blockLastNum = blockNum * PageCount;
		page.blockStartNum = page.blockLastNum - PageCount;
		if(last_page < page.blockLastNum){
			page.blockLastNum = last_page;
		}
		return page;
    }
	
}
