package com.kh.app.member.entity;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class MemberDetails extends Member implements UserDetails, OAuth2User {
	private static final long serialVersionUID = 1L;
	
	
	private List<SimpleGrantedAuthority> authorities;
	
	private Map<String, Object> attributes;
	
	@Override
	public Map<String, Object> getAttributes() {
		return this.attributes;
	}
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	@Override
	public String getUsername() {
		return this.getMemberId();
	}

	@Override
	public String getPassword() {
		return this.getMemberPwd();
	}
	

	@Override
	public String getName() {
		
		return this.getMemberName();
	}

	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}


	@Override
	public boolean isEnabled() {
		return true;
	}


}