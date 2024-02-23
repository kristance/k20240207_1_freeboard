package com.tjoeun.freeboard.vo;

import java.util.ArrayList;

//	1페이지 분량의 메인글 목록과 페이징 작업에 사용할 8개의 변수를 기억하는 클래스
public class FreeboardList {

	private ArrayList<FreeboardVO> list = new ArrayList<FreeboardVO>();
	
	private int pageSize = 10;
	private int currentPage = 1;
	private int totalPage;
	private int totalCount;
	private int startPage;
	private int endPage;
	private int startNo;
	private int endNo;
	
	
	public FreeboardList() {
	}
	
	
	public FreeboardList(int pageSize, int totalCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		calculator();
	}
	
	
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
	
	
	
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public ArrayList<FreeboardVO> getList() {
		return list;
	}
	public void setList(ArrayList<FreeboardVO> list) {
		this.list = list;
	}


	@Override
	public String toString() {
		return "FreeboardList [list=" + list + ", pageSize=" + pageSize + ", currentPage=" + currentPage
				+ ", totalPage=" + totalPage + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}


	
	
	
	
}
