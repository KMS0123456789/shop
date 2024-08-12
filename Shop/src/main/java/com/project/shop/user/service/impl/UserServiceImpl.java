package com.project.shop.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.shop.user.repository.UserRepository;
import com.project.shop.user.service.UserService;
import com.project.shop.user.vo.KakaoUser;
import com.project.shop.user.vo.OAuthToken;
import com.project.shop.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository repository;
	
	@Override
	public List<UserVO>userAll() { //UserService에 있는 List<UserVO>userAll()을 가져온다
		return repository.userAll(); //repository.userAll값을 리턴
	}
	@Override
	public int blackList(UserVO vo) {
		return repository.blackList(vo);
	}
	@Override
    public void handleKakaoCallback(String code) throws Exception {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "91452e14d92a8c67875cd1e2ec08fdd2");
        params.add("redirect_uri", "http://localhost:8080/shop/user/kakao/callback");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

        // 카카오 액세스 토큰 요청
        ResponseEntity<String> response = restTemplate.exchange(
            "https://kauth.kakao.com/oauth/token",
            HttpMethod.POST,
            kakaoTokenRequest,
            String.class
        );

        // JSON 응답을 OAuthToken 객체로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);

        // 두 번째 RestTemplate 요청
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
        headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<Void> kakaoUserRequest = new HttpEntity<>(headers2);

        ResponseEntity<String> response2 = restTemplate.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.GET,
            kakaoUserRequest,
            String.class
        );

        // JSON 응답을 KakaoUser 객체로 변환
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        KakaoUser kakaoUser = objectMapper.readValue(response2.getBody(), KakaoUser.class);

        // User 오브젝트 생성
        UserVO user = new UserVO();
        user.setEmail(kakaoUser.getKakaoAccount().getEmail());
        user.setName(kakaoUser.getKakaoAccount().getName());
        user.setPhoneNum(kakaoUser.getKakaoAccount().getPhoneNumber());

        // 사용자 저장
        repository.saveUser(user);
    }
}
