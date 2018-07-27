package com.itbank.TechFarm.blog.dao;

import java.util.List;

import com.itbank.TechFarm.blog.dto.Blog_NeighborDTO;
import com.itbank.TechFarm.blog.mybatis.BlogMapper;

public class Blog_NeighborDAOImpl implements Blog_NeighborDAO {

	@Override
	public int addNeighbor(Blog_NeighborDTO neighborDTO) {
		// TODO Auto-generated method stub
		return BlogMapper.addNeighbor(neighborDTO);
	}

	@Override
	public int deleteNeighbor(int neighborno) {
		// TODO Auto-generated method stub
		return BlogMapper.deleteNeighbor(neighborno);
	}

	@Override
	public List neighborList(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.neighborList(id);
	}

	@Override
	public List listNeighborProfile(String id) {
		// TODO Auto-generated method stub
		return BlogMapper.listNeighborProfile(id);
	}

}
