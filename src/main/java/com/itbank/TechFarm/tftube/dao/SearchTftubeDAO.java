package com.itbank.TechFarm.tftube.dao;

import java.util.List;

import com.itbank.TechFarm.tftube.dto.VideoDTO;

public interface SearchTftubeDAO {
	public  List<VideoDTO> search_single(String search,String search_text);
}
