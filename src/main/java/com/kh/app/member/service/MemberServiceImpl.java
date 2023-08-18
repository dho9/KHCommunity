package com.kh.app.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	
	
	// email 인증관련	================================================================================
	private String authNumber; 
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	public void makeRandomNumber() {

        String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

        StringBuilder prefix = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 2; i++) {
            int index = random.nextInt(letters.length());
            prefix.append(letters.charAt(index));
        }

        int randomNumber = random.nextInt(10000);
        String formattedNumber = String.format("%04d", randomNumber);

        String result = prefix.toString() + formattedNumber;

		authNumber = result;
	}
	
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "khCommunityAD@gmail.com"; 
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; 
		String content = 
				"KH Community에 방문해주셔서 감사합니다." + 
                "<br><br>" + 
			    "인증 번호는 [" + authNumber + "] 입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 입력란 기입하여 회원가입을 완료해주세요."; 
		mailSend(setFrom, toMail, title, content);
		return authNumber;
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	

}
