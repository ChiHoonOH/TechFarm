package com.itbank.TechFarm.blog.dao;

import java.util.List;

import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;

public interface Blog_OptionDAO {
	public int makeBlog(Blog_OptionDTO dto);
	public int updateVisitornum(String id);
	public Blog_OptionDTO getBlog(String id);
	public int deleteBlog(String id);
	public int editBlog_pf_int(Blog_OptionDTO dto);
	public int editBlog_layout(Blog_OptionDTO dto);
	public int editBlog_skin(Blog_OptionDTO dto);
	public int editBlog_headerword(Blog_OptionDTO dto);
	public List listNewBoard();
	public List listNewProfile();
	public List listHotBoard();
	public List listHotProfile();
	public List listHotBlog();
	public List listAreaBoard1(int startRow,int endRow);
	public List listAreaBoard2(int startRow,int endRow);
	public List listAreaBoard3(int startRow,int endRow);
	public List listAreaBoard4(int startRow,int endRow);
	public int areaboardNumber1();
	public int areaboardNumber2();
	public int areaboardNumber3();
	public int areaboardNumber4();
	public List listSearchBlog(String search_option,String search_text);
}
