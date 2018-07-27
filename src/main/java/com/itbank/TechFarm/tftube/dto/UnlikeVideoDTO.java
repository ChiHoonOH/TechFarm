package com.itbank.TechFarm.tftube.dto;

public class UnlikeVideoDTO {
	
	private int unlike_no;
	private int member_no;
	private int video_no;
	private int like_status;
	public int getUnlike_no() {
		return unlike_no;
	}
	public void setUnlike_no(int unlike_no) {
		this.unlike_no = unlike_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getVideo_no() {
		return video_no;
	}
	public void setVideo_no(int video_no) {
		this.video_no = video_no;
	}
	public int getLike_status() {
		return like_status;
	}
	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}
	
	
}
