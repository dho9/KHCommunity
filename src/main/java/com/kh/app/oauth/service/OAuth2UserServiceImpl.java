package com.kh.app.oauth.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class OAuth2UserServiceImpl extends DefaultOAuth2UserService {

	@Autowired
	private MemberService memberService;
	/**
	 * 
	 * code / token 교환 후 가져온 사용자 정보를 인자로 전달
	 * MemberDetails를 OAuth2User 구현 클래스로 사용
	 * 
	 */
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

		ClientRegistration clientRegistration = userRequest.getClientRegistration(); // IDP정보를 가지고 있음
		OAuth2AccessToken accessToken = userRequest.getAccessToken();
		OAuth2User oauth2User = super.loadUser(userRequest);
		
		log.debug("clientRegistration ={}", clientRegistration);
		log.debug("accessToken ={}", accessToken);
		log.debug("oauth2USer ={}", oauth2User);
		
		Map<String, Object> attributes = oauth2User.getAttributes();
		String memberId = attributes.get("id") + "@kakao";
		
		MemberDetails member = null;
		// 1. 기존 회원가입 여부 조회 (회원가입 처리)
		
		try {
			member = (MemberDetails) memberService.loadUserByUsername(memberId);
		} catch (UsernameNotFoundException ignore) {
            // a. 회원이 아닌 경우 회원가입 처리
            Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
            Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");

            String name = (String) profile.get("nickname");
            String email = (String) kakaoAccount.get("email");
            MemberCreateDto memberCreateDto = MemberCreateDto.builder()
                                                .memberId(memberId)
                                                .memberPwd("1234") // 의미없지만 값은 줘야함
                                                .memberName(name)
                                                .email(email)
                                                .memberPhone("-")
                                                .birthday(null)
                                                .build();
            int reuslt = memberService.insertMember(memberCreateDto);
            member = (MemberDetails) memberService.loadUserByUsername(memberId);
        }
		
		
		return member;
	}
}
