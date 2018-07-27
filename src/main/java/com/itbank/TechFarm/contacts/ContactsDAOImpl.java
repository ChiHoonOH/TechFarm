package com.itbank.TechFarm.contacts;

import java.util.List;

public class ContactsDAOImpl implements ContactsDAO{

	@Override
	public List<ContactsDTO> listContacts(String id) {
		return ContactsMapper.liseContacts(id);
	}

	@Override
	public ContactsDTO getContact(int no) {
		return ContactsMapper.getContact(no);
	}

	@Override
	public int addContact(ContactsDTO dto) {
		return ContactsMapper.addContacts(dto);
	}

	@Override
	public int editContact(ContactsDTO dto) {
		return ContactsMapper.editContact(dto);
	}

	@Override
	public int deleteContact(int no) {
		return ContactsMapper.deleteContact(no);
	}

}
