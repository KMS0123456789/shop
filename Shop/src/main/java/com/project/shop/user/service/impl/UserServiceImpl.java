package com.project.shop.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
import com.project.shop.user.vo.AddrVO;
import com.project.shop.user.vo.KakaoUser;
import com.project.shop.user.vo.OAuthToken;
import com.project.shop.user.vo.UserVO;

@Service 
public class UserServiceImpl implements UserService {
    
    @Autowired  // UserRepository 객체를 자동으로 주입받도록 설정
    private UserRepository repository;
    
  //블랙리스트 페이징 기능
  	@Override
  	public Page<UserVO> userAll(Pageable pageable, String searchType, String keyword) {
  		return repository.userAll(pageable, searchType, keyword); //ComputerRepository의 메서드 managerQnA 실행
  	}
  	
  	//블랙리스트 전체 개수 조회
  	@Override
  	public int count(String searchType, String keyword) {
  		return repository.count(searchType, keyword); //ComputerRepository의 메서드 count 실행
  	}
    
    @Override
    public int blackList(UserVO vo) {
        return repository.blackList(vo); //유저의 타입을 블랙리스트로 바꾸는 메서드 호출
    }

    @Override
    public UserVO join(String code) throws Exception {
        RestTemplate restTemplate = new RestTemplate();  // HTTP 요청을 보낼 RestTemplate 객체 생성

        HttpHeaders headers = new HttpHeaders();  // HTTP 요청 헤더를 설정할 객체 생성
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");  // 헤더에 Content-Type 설정

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();  // 요청 파라미터를 담을 맵 생성
        params.add("grant_type", "authorization_code");  // 인증 코드 유형 설정
        params.add("client_id", "91452e14d92a8c67875cd1e2ec08fdd2");  // 클라이언트 ID 설정
        params.add("redirect_uri", "http://jjezen.cafe24.com/custompcshop/user/kakao/callback.do");  // 리다이렉트 URI 설정
        						/*http://jjezen.cafe24.com/custompcshop/user/kakao/callback.do
        						http://localhost:8080/shop/user/kakao*/	
        params.add("code", code);  // 카카오에서 받은 인증 코드 설정

        // 요청 파라미터와 헤더를 포함한 HttpEntity 객체 생성
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

        // 카카오 인증 서버에 토큰 요청을 보내고 응답을 받아옴
        ResponseEntity<String> response = restTemplate.exchange(
            "https://kauth.kakao.com/oauth/token",
            HttpMethod.POST,
            kakaoTokenRequest,
            String.class
        );

        // JSON 문자열을 OAuthToken 객체로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);

        // 사용자 정보를 요청할 때 사용할 새로운 헤더 설정
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());  // 액세스 토큰을 Authorization 헤더에 추가
        headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");  // Content-Type 설정

        // 헤더만 포함된 HttpEntity 객체 생성
        HttpEntity<Void> kakaoUserRequest = new HttpEntity<>(headers2);

        // 카카오 API를 호출해 사용자 정보를 가져옴
        ResponseEntity<String> response2 = restTemplate.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.GET,
            kakaoUserRequest,
            String.class
        );

        // JSON 문자열을 KakaoUser 객체로 변환
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);  // 매핑되지 않은 속성 무시
        KakaoUser kakaoUser = objectMapper.readValue(response2.getBody(), KakaoUser.class);

        // 이메일을 기준으로 사용자가 DB에 존재하는지 확인
        UserVO user = repository.findUserByEmail(kakaoUser.getKakaoAccount().getEmail());

        if (user == null) {  // 사용자가 DB에 없으면
            user = new UserVO();  // 새로운 사용자 객체 생성
            user.setEmail(kakaoUser.getKakaoAccount().getEmail());  // 이메일 설정
            user.setName(kakaoUser.getKakaoAccount().getName());  // 이름 설정
            user.setPhoneNum(kakaoUser.getKakaoAccount().getPhoneNumber());  // 전화번호 설정

            repository.join(user);  // 새로운 사용자 정보를 DB에 저장
        }

        return user;  // 최종적으로 사용자를 반환
    }

    @Override
    public UserVO findUserByEmail(String email) {
        return repository.findUserByEmail(email);  // 이메일로 사용자 검색 메서드 호출
    }
    
    @Override
    public UserVO login(UserVO vo) {
        return repository.login(vo);  // 로그인 처리 후 사용자 정보를 반환
    }

	@Override
	public UserVO mylist(UserVO vo) {
		// TODO Auto-generated method stub
		return repository.mylist(vo); // 해당 사용자의 찜한 개수 찾는 메서드 호출
	}


}

