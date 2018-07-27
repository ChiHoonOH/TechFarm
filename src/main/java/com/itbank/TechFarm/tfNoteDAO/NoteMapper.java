package com.itbank.TechFarm.tfNoteDAO;

import java.io.Reader;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.tfNoteDTO.NoteDTO;

public class NoteMapper {

  private static SqlSessionFactory sqlMapper;
  static {
    try {
    	String resource = "com/itbank/TechFarm/SqlMapConfig_tfnote.xml";
    	Reader reader = Resources.getResourceAsReader(resource);
    	sqlMapper = new SqlSessionFactoryBuilder().build(reader);
    } catch (IOException e) {
      // Fail fast.
      throw new RuntimeException
       ("Something bad happened while building the SqlMapClient instance." + e, e);
    }
  }

  public static List<NoteDTO> listNote(String id){
	  SqlSession session = sqlMapper.openSession();
	  List<NoteDTO> noteList = session.selectList("listNote",id);
	  session.close();
	  return noteList;
  }
 
  	public static NoteDTO getNote(int num){
		SqlSession session = sqlMapper.openSession();
		NoteDTO dto = (NoteDTO)session.selectOne("getNote", num);
		session.close();
		return dto;
	}
	
	public static int deleteNote(int num){
		SqlSession session = sqlMapper.openSession();
		int res = session.delete("deleteNote", num);
		session.commit();
		session.close();
		return res;
	}
	
	public static int insertNote(NoteDTO dto){
		SqlSession session = sqlMapper.openSession();
		int res = session.insert("insertNote", dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int updateNote(NoteDTO dto){
		SqlSession session = sqlMapper.openSession();
		int res = session.update("updateNote", dto);
		session.commit();
		session.close();
		return res;
	}  
  
}











