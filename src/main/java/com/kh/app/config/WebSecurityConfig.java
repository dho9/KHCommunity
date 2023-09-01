package com.kh.app.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.kh.app.member.service.MemberService;


@SuppressWarnings("deprecation")
@EnableWebSecurity //@Configration 상속
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private DataSource dataSource;

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().mvcMatchers("/resources/**");
		
	}
	
	@Autowired
	private MemberService memberService;
	
	@Bean
	public PersistentTokenRepository tokenRepository() {
		JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}

	@Autowired
	private OAuth2UserService oauth2UserService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/", "/index.jsp","/member/mailCheck").permitAll()
			.antMatchers("/board/**").permitAll()
			.antMatchers("/admin/**").hasAuthority("ADMIN")
			.antMatchers("/board/*").permitAll()
			.antMatchers("/ticket/*").permitAll()
			.antMatchers("/member/memberCreate.do").permitAll()
			.antMatchers("/member/memberCreate2.do").permitAll()
			.antMatchers("/member/*").authenticated()
			.antMatchers("/store/*").permitAll()
			.antMatchers("/calendar/**").authenticated()
			.anyRequest().authenticated();
		
		http.formLogin() // 
		.loginPage("/member/memberLogin.do")
		.loginProcessingUrl("/member/memberLogin.do")
		.usernameParameter("memberId")
		.passwordParameter("memberPwd")
		.defaultSuccessUrl("/")
		.permitAll();
	
		http.logout()
		.logoutUrl("/member/memberLogout.do")
		.logoutSuccessUrl("/")
		.permitAll();
		
		http.oauth2Login()
		.loginPage("/member/memberLogin.do")
		.userInfoEndpoint()
		.userService(oauth2UserService);
		
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
	
	}
	
	
}
