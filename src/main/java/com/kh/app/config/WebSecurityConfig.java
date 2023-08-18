package com.kh.app.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;


@SuppressWarnings("deprecation")
@EnableWebSecurity //@Configration 상속
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().mvcMatchers("/resources/**");
		
	}
	

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/", "/index.jsp").permitAll()

			.antMatchers("/board/*").permitAll()
			.antMatchers("/admin/*").permitAll()
			.antMatchers("/board/*").permitAll()
			.antMatchers("/ticket/*").permitAll()
			.antMatchers("/member/*").permitAll()
			.antMatchers("/store/*").permitAll()
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
	}
	
}
