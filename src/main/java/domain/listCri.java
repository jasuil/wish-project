package domain;

// 한 화면의 목록부분 관련
public class listCri {
private int totalCount; //레코드의 갯수
private int listNumber; //하나의 목록에 출력되는 갯수
private int currentPage; 
private int pageStart;

public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
}
public int getListNumber() {
	return listNumber;
}
public void setListNumber(int listNumber) {
	this.listNumber = listNumber;
}
public int getCurrentPage() {
	
	return currentPage;
}
public void setCurrentPage(int currentPage) {
	if(currentPage<=0)
		this.currentPage=1;
	
	this.currentPage = currentPage;
}

@Override
public String toString() {
	return "listCri [totalCount=" + totalCount + ", listNumber=" + listNumber + ", currentPage=" + currentPage
			+ ", pageStart="+getPageStart()+"]";
}
public listCri(){
	this.currentPage = 1;
	this.listNumber = 10;
	this.totalCount = 0;
}
 
// Mybatis에서  pageStart로 인식됨
public int getPageStart(){
	return (this.currentPage -1)* this.listNumber; //목록 당 출력되는 레코드의 갯수 
}
public void setPageStart(int pageStart) {
	this.pageStart = pageStart;
}
}
