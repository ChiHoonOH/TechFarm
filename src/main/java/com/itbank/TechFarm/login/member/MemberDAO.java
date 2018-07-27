package com.itbank.TechFarm.login.member;

import java.util.List;

public interface MemberDAO {
	public int insertMember(MemberDTO dto);
	public MemberDTO getLogin(String id);
	public MemberDTO getMember(String id);
	public MemberDTO getMember_by_no(int no);
	public int editMember(MemberDTO dto);
	public int editPw(MemberDTO dto);
	public int deleteMember(int no);
	public MemberDTO searchId(String email);
}
