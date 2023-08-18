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
			.antMatchers("/board/**").permitAll()
			.antMatchers("/admin/**").permitAll()
			.antMatchers("/board/**").permitAll()
			.antMatchers("/ticket/**").permitAll()
			.antMatchers("/member/**").permitAll()
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
	
	// csrf (cross site request forgery) 공격대비 토큰 사용 (기본값)
	// http.csrf().disable(); // 토큰 사용안함
	
	// remember-me관련
	/*
	 * http.rememberMe() .tokenRepository(tokenRepository())
	 * .key("hello-springboot-secret") .tokenValiditySeconds(60 * 60 * 24 * 14); //
	 * 2주
	 * 
	 * http.oauth2Login() .loginPage("/member/memberLogin.do") .userInfoEndpoint()
	 * .userService(oauth2UserService);
	 */
	}
	
	
	
}
