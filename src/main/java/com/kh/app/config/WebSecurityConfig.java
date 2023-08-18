package com.kh.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


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
			.anyRequest().authenticated();
		
	}
	
	
}
