package com.itbank.TechFarm.blog.dao;

import java.util.List;

import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;
import com.itbank.TechFarm.blog.mybatis.BlogMapper;

public class Blog_OptionDAOImpl implements Blog_OptionDAO {

	@Override
	public Blog_OptionDTO getBlog(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.getBlog(id);
	}

	@Override
	public int makeBlog(Blog_OptionDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.makeBlog(dto);
	}

	@Override
	public int deleteBlog(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.deleteBlog(id);
	}

	@Override
	public int editBlog_pf_int(Blog_OptionDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.editBlog_pf_int(dto);
	}

	@Override
	public int editBlog_layout(Blog_OptionDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.editBlog_layout(dto);
	}

	@Override
	public int editBlog_skin(Blog_OptionDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.editBlog_skin(dto);
	}

	@Override
	public int editBlog_headerword(Blog_OptionDTO dto) {
		// TODO Auto-generated method stub
		return BlogMapper.editBlog_headerword(dto);
	}
	
	@Override
	public List listNewBoard() {
		// TODO Auto-generated method stub
		return BlogMapper.listNewBoard();
	}

	@Override
	public List listHotBoard() {
		// TODO Auto-generated method stub
		return BlogMapper.listHotBoard();
	}

	@Override
	public List listHotProfile() {
		// TODO Auto-generated method stub
		return BlogMapper.listHotProfile();
	}

	@Override
	public List listNewProfile() {
		// TODO Auto-generated method stub
		return BlogMapper.listNewProfile();
	}

	@Override
	public List listHotBlog() {
		// TODO Auto-generated method stub
		return BlogMapper.listHotBlog();
	}

	@Override
	public int updateVisitornum(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.updateVisitornum(id);
	}

	@Override
	public List listSearchBlog(String search_option, String search_text) {
		// TODO Auto-generated method stub
		return BlogMapper.listSearchBlog(search_option, search_text);
	}

	@Override
	public List listAreaBoard1(int startRow,int endRow) {
		// TODO Auto-generated method stub
		return BlogMapper.listAreaBoard1(startRow, endRow);
	}

	@Override
	public List listAreaBoard2(int startRow,int endRow) {
		// TODO Auto-generated method stub
		return BlogMapper.listAreaBoard2(startRow, endRow);
	}

	@Override
	public List listAreaBoard3(int startRow,int endRow) {
		// TODO Auto-generated method stub
		return BlogMapper.listAreaBoard3(startRow, endRow);
	}

	@Override
	public List listAreaBoard4(int startRow,int endRow) {
		// TODO Auto-generated method stub
		return BlogMapper.listAreaBoard4(startRow, endRow);
	}

	@Override
	public int areaboardNumber1() {
		// TODO Auto-generated method stub
		return BlogMapper.areaboardNumber1();
	}

	@Override
	public int areaboardNumber2() {
		// TODO Auto-generated method stub
		return BlogMapper.areaboardNumber2();
	}

	@Override
	public int areaboardNumber3() {
		// TODO Auto-generated method stub
		return BlogMapper.areaboardNumber3();
	}

	@Override
	public int areaboardNumber4() {
		// TODO Auto-generated method stub
		return BlogMapper.areaboardNumber4();
	}

}
