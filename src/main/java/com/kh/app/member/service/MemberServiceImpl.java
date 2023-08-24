package com.kh.app.member.service;

import java.util.List;
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

import com.kh.app.curriculum.entity.Curriculum;
import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.dto.StudentMypageInfoDto;
import com.kh.app.member.entity.Member;
import com.kh.app.member.entity.Student;
import com.kh.app.member.entity.StudentAttachment;
import com.kh.app.member.entity.Vacation;
import com.kh.app.member.entity.VacationAttachment;
import com.kh.app.member.repository.MemberRepository;
import com.kh.app.ticket.dto.TicketBuyDto;
import com.nimbusds.openid.connect.sdk.assurance.evidences.attachment.Attachment;

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
				"<div style='margin:20px;'>"
				+ "<h1>KH Community에 방문해주셔서 감사합니다.</h1>" 
                + "<br><br>"
			    + "<div align='center' style='border:1px solid black; font-family:verdana';>"
			    + "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>"
			    + "<div style='font-size:130%'>"
			    + "[<mark>" + authNumber + "</mark>]"
			    + "</div>" 
			    + "</div>" 
			    + "<br>"
			    + "해당 인증번호를 인증번호 입력란 기입하여 회원가입을 완료해주세요."
			    + "</div>"; 
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


	// 회원정보수정
	@Override
	public int updateMember(Member member) {
		return memberRepository.updateMember(member);
	}

	

	@Override
	public Student findStudentById(String memberId) {
		return memberRepository.findStudentById(memberId);
	}

	@Override
	public int insertStudentAttach(StudentAttachment attach) {
		int result = memberRepository.insertStudentAttach(attach);
		result = memberRepository.updateApproveRequestDate(attach);
		return result;
	}

	@Override
	public int deleteMember(String memberId) {
		return memberRepository.deleteMember(memberId);
	}

	@Override
	public StudentMypageInfoDto findByMemberInfo(String memberId) {
		return memberRepository.findByMemberInfo(memberId);
	}

	@Override
	public List<TicketBuyDto> findByTicketInfo(String memberId) {
		return memberRepository.findByTicketInfo(memberId);
	}

	@Override
	public Curriculum findByDdayInfo(int curriculumId) {
		return memberRepository.findByDdayInfo(curriculumId);
	}

//	@Override
//	public int insertVacationAttach(VacationAttachment attach, MemberDetails member) {
//		int result=0;
//		result = memberRepository.insertVacation(member);
//		result = memberRepository.insertVacationAttach(attach);
//		result = memberRepository.updateVacationState(attach);
//		return result;
//	}


	@Override
	public int insertVacation(Vacation vacation) {
		int result = 0;
		
		
		result = memberRepository.insertVacation(vacation);
		log.debug("board = {}", vacation);
		//attachment 저장
		List<VacationAttachment> attachments = ((Vacation) vacation).getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(VacationAttachment attach : attachments) {
				attach.setVacationId(vacation.getVacationId());
				result = memberRepository.insertAttachment(attach);
			}
		}
		
		return result;
	}



	

}
