package com.hklmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hklmart.domain.MemberVO;
import com.hklmart.persistence.MemberDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberService{
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberDAO memberDAO;

	public void registMember(MemberVO memberVO) {
		memberVO.setMemberAuthorities("ROLE_MEMBER");
		memberVO.setMemberPw(passwordEncoder.encode(memberVO.getMemberPw()));
		memberDAO.registMember(memberVO);
	}
	
	public MemberVO getMemberInfo(String memberId) {
		MemberVO memberVO = memberDAO.getMemberInfo(memberId);
		return memberVO;
	}
	
	public void updatePassword(String memberId, String memberPw) {
		memberDAO.updatePassword(memberId, passwordEncoder.encode(memberPw));
	}
	
}
