package paging;

import event.UserDAO;

public class Paging {
	public final static int pageCount = 5;
	public int blockStartNum = 0;
	public int blockLastNum = 0;
	public int lastPageNum = 0;
	
	public int getBlockStartNum() {
	    return blockStartNum;
	}
	public void setBlockStartNum(int blockStartNum) {
	    this.blockStartNum = blockStartNum;
	}
	public int getBlockLastNum() {
	    return blockLastNum;
	}
	public void setBlockLastNum(int blockLastNum) {
	    this.blockLastNum = blockLastNum;
	}
	public int getLastPageNum() {
	    return lastPageNum;
	}
	public void setLastPageNum(int lastPageNum) {
	    this.lastPageNum = lastPageNum;
	}
	
	public void makeBlock(int curPage){
		int blockNum = 0;
	     
	    blockNum = (int)Math.floor((curPage-1)/ pageCount);
	    blockStartNum = (pageCount * blockNum) + 1;
	    blockLastNum = blockStartNum + (pageCount-1);
    }
		   
	// 총 페이지의 마지막 번호
    public void makeLastPageNum() {
    	UserDAO userDAO = new UserDAO();
    	int total = userDAO.count();
    	
    	if( total % pageCount == 0 ) {
    		lastPageNum = (int)Math.floor(total/pageCount);
    	}
    	else {
    		lastPageNum = (int)Math.floor(total/pageCount) + 1;
    	}
    }
}
