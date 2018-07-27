package com.itbank.TechFarm.blog.dao;

import java.util.List;

import com.itbank.TechFarm.blog.dto.Blog_NeighborDTO;

public interface Blog_NeighborDAO {
	
	public int addNeighbor(Blog_NeighborDTO dto);
	public int deleteNeighbor(int neighborno);
	public List neighborList(String id);
	public List listNeighborProfile(String id);

}
