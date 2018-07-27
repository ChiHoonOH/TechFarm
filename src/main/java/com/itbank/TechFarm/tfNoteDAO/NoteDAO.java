package com.itbank.TechFarm.tfNoteDAO;

import java.util.List;

import com.itbank.TechFarm.tfNoteDTO.NoteDTO;

public interface NoteDAO {
	public List<NoteDTO> listNote(String id);
	public NoteDTO getNote(int num);
	public int deleteNote(int num);
	public int insertNote(NoteDTO dto);
	public int updateNote(NoteDTO dto);	
}
