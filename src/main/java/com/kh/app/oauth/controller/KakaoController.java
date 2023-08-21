package com.kh.app.oauth.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.app.member.dto.MemberCreateDto;
import com.kh.app.member.entity.MemberDetails;
import com.kh.app.member.service.MemberService;
import com.kh.app.oauth.service.KakaoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/oauth/kakao")
@SessionAttributes({"access_token","refresh_token"})
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login.do")
	public RedirectView login() {
		
		return new RedirectView(kakaoService.getAuthorizeUri());
	}
	
	
	@GetMapping("/callback.do")
    public RedirectView callback(@RequestParam String code, Model model, HttpServletRequest request) {
        // 1. 토큰발급받기
        Map<String, Object> tokens = kakaoService.getTokens(code);
        // 세션에 토큰저장
        model.addAttribute("access_token", tokens.get("access_token"));
        model.addAttribute("refresh_token", tokens.get("refresh_token"));

        // 2. 사용자정보 요청하기
        Map<String, Object> attributes = kakaoService.getProfile((String) tokens.get("access_token"));

        // 3. 회원가입/로그인 처리
        // 회원조회후 가입여부확인
        String memberId = attributes.get("id") + "@kakao";
        MemberDetails member = null;
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
                                                .build();
            int reuslt = memberService.insertMember(memberCreateDto);

            member = (MemberDetails) memberService.loadUserByUsername(memberId);
        }

        // b. 로그인처리 (SecurityContextHolder에 authentication 수동 등록)
        Authentication authentication = new UsernamePasswordAuthenticationToken(
                member,
                member.getPassword(),
                member.getAuthorities()
            );
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return new RedirectView(request.getContextPath() + "/");
    }
	
}