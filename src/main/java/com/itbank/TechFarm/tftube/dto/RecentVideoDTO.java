package com.itbank.TechFarm.tftube.dto;

public class RecentVideoDTO {
	private int recent_no;
	private int member_no;
	private String video_name;
	
	
	public int getRecent_no() {
		return recent_no;
	}
	public void setRecent_no(int recent_no) {
		this.recent_no = recent_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	
	
}
