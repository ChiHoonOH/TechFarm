package com.itbank.TechFarm.contacts;

import java.util.List;

public interface ContactsDAO {
	public List<ContactsDTO> listContacts(String id);
	public ContactsDTO getContact(int no);
	public int addContact(ContactsDTO dto);
	public int editContact(ContactsDTO dto);
	public int deleteContact(int no);
}
