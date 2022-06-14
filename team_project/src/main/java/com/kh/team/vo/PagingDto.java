package com.kh.team.vo;

public class PagingDto {
	private int page = 1;
	private int startRow;
	private int endRow;
	private String searchType;
	private String keyword;
	private int perPage = 10;
	private int totalPage;
	private int count;
	private int startPage;
	private int endPage;
	private final int PAGE_BLOCK = 5;

	public PagingDto() {
		super();
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		this.startRow = this.page * perPage - (this.perPage - 1);
		this.endRow = this.startRow + (this.perPage - 1);
		totalPage = (int) (Math.ceil((double) count / perPage));
		this.startPage = ((page - 1) / PAGE_BLOCK) * PAGE_BLOCK + 1;
		this.endPage = startPage + (PAGE_BLOCK - 1);
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
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

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", searchType="
				+ searchType + ", keyword=" + keyword + ", perPage=" + perPage + ", totalPage=" + totalPage + ", count="
				+ count + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
}
