package com.project.shop.user.service;

import java.util.List;

import com.project.shop.user.vo.UserVO;

public interface UserService {
	List<UserVO> userAll();
	int blackList(UserVO vo);
}
