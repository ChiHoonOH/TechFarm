package com.itbank.TechFarm.james;

public class PageMaker {
	private int pageSize=10;
	private int page;
	private int count;
	private int start;
	private int end;
	private boolean prev;
	private boolean next;
	
	public int getPage(){
		return page;
	}
	
	public void setPage(int page){
		if(page<1){
			this.page=1;
			return;
		}
		this.page = page;
	}
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count){
		if(count<1){
			return;
		}
		this.count = count;
		
		calcPage();
	}
	private void calcPage(){
		int tempEnd = (int)(Math.ceil(page / (float)pageSize)*pageSize);
		
		this.start = tempEnd - (pageSize-1);
		if(tempEnd *pageSize > this.count){
			this.end = (int)Math.ceil(this.count/(float)pageSize);
		}else{
			this.end = tempEnd;
		}
		
		this.prev = this.start !=1;
		this.next = this.end *10 < this.count;
	}
	
}
