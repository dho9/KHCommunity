package com.kh.app.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.repository.MemberRepository;

import lombok.extern.slf4j.Slf4j;


@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public int insertMember(MemberCreateDto member) {
		int result = 0;

		result = memberRepository.insertMember(member);
		
		result = memberRepository.insertAuthority(member);
		
		result = memberRepository.insertStudent(member);
		
		return result;
	}

	@Override
	public Member findMemberById(String memberId) {
		
		return memberRepository.findMemberById(memberId);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserDetails memberDetails = memberRepository.loadUserByUsername(username);
		log.debug("memberDetails={}", memberDetails);
		if(memberDetails == null)
			throw new UsernameNotFoundException(username);
		
		return memberDetails;
	}


}
