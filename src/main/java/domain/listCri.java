package domain;

// �� ȭ���� ��Ϻκ� ����
public class listCri {
private int totalCount; //���ڵ��� ����
private int listNumber; //�ϳ��� ��Ͽ� ��µǴ� ����
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
 
// Mybatis����  pageStart�� �νĵ�
public int getPageStart(){
	return (this.currentPage -1)* this.listNumber; //��� �� ��µǴ� ���ڵ��� ���� 
}
public void setPageStart(int pageStart) {
	this.pageStart = pageStart;
}
}
