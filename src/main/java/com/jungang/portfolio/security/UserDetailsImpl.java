package com.jungang.portfolio.security;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.jungang.portfolio.domain.UserVO;

public class UserDetailsImpl implements UserDetails {

	private String username;
	private String password;
	private List<Role> authorities;
	private UserVO userVO;
	
	public UserDetailsImpl(String username,
						   String password,
						   UserVO userVO,
						   List<Role> authorities) {
		
		this.username = username;
		this.password = password;
		this.authorities = authorities;
		
	}
	
	@Override
	public List<Role> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
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
