package jspex.jdbc;

public class PageBean {
	private int totalRows;
	private int pageSize;
	private int currentPage;
	private int totalPages;
	private int startRow;
	
	public PageBean(){
	}
	
	public PageBean(int _totalRows,int _pageSize){
		pageSize = _pageSize;
		totalRows = _totalRows;
		//totalPages = ((totalRows%pageSize)==0?(totalRows/pageSize):(totalRows/pageSize)+1);
		totalPages = totalRows/pageSize;
		int mod = totalRows%pageSize;
		if(mod>0){
			totalPages++;
		}
		currentPage = 1;
		startRow = 0;
	}
	
	public int getStartRow(){
		return startRow;
	}
	
	public int getTotalPages(){
		return totalPages;
	}
	
	public int getCurrentPage(){
		return pageSize;
	}
	
	public int getPageSize(){
		return pageSize;
	}
	
	public int getTotalRows(){
		return totalRows;
	}
	
	public void setStartRow(int startRow){
		this.startRow = startRow;
	}
	
	public void setTotalRows(int totalRows){
		this.totalRows = totalRows;
	}
	
	public void setTotalPages(int totalPages){
		this.totalPages = totalPages;
	}
	
	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}
	
	public void setPageSize(int pageSize){
		this.pageSize = pageSize;
	}
	
	public void first(){
		currentPage = 1;
		startRow = 0;
	}
	
	public void previous(){
		if(currentPage==1){
			return ;
		}
		currentPage--;
		startRow = pageSize*(currentPage-1);
	}
	
	public void next(){
		if(currentPage<totalPages){
			currentPage++;
		}
		startRow = (currentPage-1)*pageSize;
	}
	
	public void last(){
		currentPage = totalPages;
		startRow = (currentPage-1)*pageSize;
	}
	
	public void refresh(int _currentPage){
		currentPage = _currentPage;
		if(currentPage > totalPages){
			currentPage = totalPages;
		}
		if(currentPage<1){
			currentPage = 1;
		}
		startRow = (currentPage-1)*pageSize;
	}

	@Override
	public String toString() {
		return "PageBean [totalRows=" + totalRows + ", pageSize=" + pageSize
				+ ", currentPage=" + currentPage + ", totalPages=" + totalPages
				+ ", startRow=" + startRow + "]";
	}
	
}
