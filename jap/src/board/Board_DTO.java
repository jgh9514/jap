package board;

public class Board_DTO {
	private int board_id;
	private int board_use;
	private String board_name;
	private int board_list_view_count;
	private int board_list_count;
	private String board_sort;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getBoard_use() {
		return board_use;
	}
	public void setBoard_use(int board_use) {
		this.board_use = board_use;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public int getBoard_list_view_count() {
		return board_list_view_count;
	}
	public void setBoard_list_view_count(int board_list_view_count) {
		this.board_list_view_count = board_list_view_count;
	}
	public int getBoard_list_count() {
		return board_list_count;
	}
	public void setBoard_list_count(int board_list_count) {
		this.board_list_count = board_list_count;
	}
	public String getBoard_sort() {
		return board_sort;
	}
	public void setBoard_sort(String board_sort) {
		this.board_sort = board_sort;
	}
}
