package com.soso.app.user.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.soso.app.admin.service.AdminVO;
import com.soso.app.member.mapper.MemberMapper;
import com.soso.app.member.service.MemberVO;
import com.soso.app.user.mapper.UserMapper;
import com.soso.app.user.service.UserService;
import com.soso.app.user.service.UserVO;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

	
	@Autowired UserMapper userMapper;
	@Autowired MemberMapper memberMapper;

	@Override
	public AdminVO storeInfo(AdminVO adminVO) {
		return userMapper.storeInfo(adminVO);
	}
	
	
	@Override
	public UserVO getUser(UserVO userVO) {
		return userMapper.getUser(userVO);
	}

	@Override
	public List<Map> getRole(UserVO userVO) {
		return userMapper.getRole(userVO);
	} 
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO userVO = new UserVO();
		userVO.setLoginId(username);
		userVO = userMapper.getUser(userVO);
		
		if(userVO == null) {
			throw new UsernameNotFoundException("no user");
		}
		userVO.setAuthorities(getAuthorities(userVO));
		return userVO;
	}
	
	public Collection<GrantedAuthority> getAuthorities(UserVO vo){
		List<Map> authList = userMapper.getRole(vo);
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(Map map : authList) {
			authorities.add(new SimpleGrantedAuthority(
					(String)map.get("ROLE_NAME")));
		}
		return authorities;
		
	}
	
	


	
}

