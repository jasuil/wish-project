package domain;

public class searchCri extends listCri{

	private String searchType;
	private String keyword;
	
	
	@Override
	public String toString() {
		return super.toString() + "searchCri [searchType=" + searchType + ", keyword=" + keyword + "]";
	}


	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public searchCri() {
		// TODO Auto-generated constructor stub
	}

}
