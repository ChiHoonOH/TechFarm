package com.itbank.TechFarm.tftube.dao;

import java.util.List;

import com.itbank.TechFarm.tftube.dto.VideoDTO;
import com.itbank.TechFarm.tftube.mybatis.SearchMapper;

public class SearchTftubeDAOImpl implements SearchTftubeDAO{

	

	@Override
	public List<VideoDTO> search_single(String search, String search_text) {

		return SearchMapper.search_single(search, search_text);
	}	
	

}
