package com.kh.team.vo;

public class SearchDto {
	
	private String searchType;
	private String keyword;
	private int gno;
	
	public SearchDto() {
		super();
	}

	public SearchDto(String searchType, String keyword) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public SearchDto(String searchType, String keyword, int gno) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
		this.gno = gno;
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

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	@Override
	public String toString() {
		return "SearchDto [searchType=" + searchType + ", keyword=" + keyword + ", gno=" + gno + "]";
	}

}
