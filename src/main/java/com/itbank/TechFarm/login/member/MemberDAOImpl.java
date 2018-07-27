package com.itbank.TechFarm.login.member;

import java.util.List;

public class MemberDAOImpl implements MemberDAO{
	@Override
	public int insertMember(MemberDTO dto) {
		int res=MemberMapper.insertMember(dto);
		return res;
	}

	@Override
	public MemberDTO getLogin(String id) {
		MemberDTO dto=new MemberDTO();
		dto=MemberMapper.getLogin(id);
		return dto;
	}

	@Override
	public MemberDTO getMember(String id) {
		MemberDTO dto=new MemberDTO();
		dto=MemberMapper.getMember(id);
		return dto;
	}

	@Override
	public MemberDTO getMember_by_no(int no) {
		return MemberMapper.getMember_by_no(no);
	}

	@Override
	public int editMember(MemberDTO dto) {
		int res=MemberMapper.editMember(dto);
		return res;
	}

	@Override
	public int editPw(MemberDTO dto) {
		int res=MemberMapper.editPw(dto);
		return res;
	}

	@Override
	public int deleteMember(int no) {
		int res=MemberMapper.deleteMember(no);
		return res;
	}

	@Override
	public MemberDTO searchId(String email) {
		MemberDTO res=MemberMapper.searchId(email);
		return res;
	}
	
	
}
