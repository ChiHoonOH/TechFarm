package com.itbank.TechFarm.tfNoteDAO;

import java.util.List;

import com.itbank.TechFarm.tfNoteDTO.NoteDTO;

public class NoteDAOImpl implements NoteDAO {
	
	@Override
	public List<NoteDTO> listNote(String id) {
		return NoteMapper.listNote(id);
	}

	@Override
	public NoteDTO getNote(int num) {
		return NoteMapper.getNote(num);
	}
	
	@Override
	public int deleteNote(int num) {
		return NoteMapper.deleteNote(num);
	}

	@Override
	public int insertNote(NoteDTO dto) {
		return NoteMapper.insertNote(dto);
	}

	@Override
	public int updateNote(NoteDTO dto) {
		return NoteMapper.updateNote(dto);
	}

}








