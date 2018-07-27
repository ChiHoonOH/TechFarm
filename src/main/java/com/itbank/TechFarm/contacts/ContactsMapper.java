package com.itbank.TechFarm.contacts;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ContactsMapper {
	private static SqlSessionFactory sqlMapper;

	  static {
	    try {
	    	String resource="com/itbank/TechFarm/SqlMapConfig_tfcontacts.xml";
	    	Reader reader = Resources.getResourceAsReader(resource); 
			sqlMapper = new SqlSessionFactoryBuilder().build(reader); 
	    } catch (IOException e) {
	      throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
	    }
	  }
	  
	  public static List<ContactsDTO> liseContacts(String id){
		  SqlSession session=sqlMapper.openSession();
		  List<ContactsDTO> listContacts = session.selectList("listContacts", id);
		  session.close();
		  return listContacts;
	  }
	  public static int addContacts(ContactsDTO dto){
		  SqlSession session = sqlMapper.openSession();
		  int res = session.insert("addContact", dto);
		  session.commit();
		  session.close();
		  return res;
	  }
	  public static ContactsDTO getContact(int no){
			SqlSession session = sqlMapper.openSession();
			ContactsDTO dto = session.selectOne("getContact", no);
			session.close();
			return dto;
		}
	  public static int deleteContact(int no){
		  SqlSession session = sqlMapper.openSession();
		  int res = session.delete("deleteContact", no);
		  session.commit();
		  session.close();
		  return res;
	  }
	  public static int editContact(ContactsDTO dto){
		  SqlSession session = sqlMapper.openSession();
		  int res = session.update("editContact", dto);
		  session.commit();
		  session.close();
		  return res;
	  }
}
