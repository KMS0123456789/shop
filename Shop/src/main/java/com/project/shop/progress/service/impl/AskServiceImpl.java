package com.project.shop.progress.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.progress.repository.AskRepository;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.user.repository.UserRepository;

@Service
public class AskServiceImpl implements AskService{
	
	@Autowired
	private AskRepository repository;

    @Autowired
    private UserRepository userRepository; 
	
    @Override
    @Transactional
    public void completePaymentAndInsert(AskVO ask) throws Exception {
        if (!userExists(ask.getAskUser())) {
            throw new Exception("User does not exist: " + ask.getAskUser());
        }
        ask.setAskDate(LocalDateTime.now().toString());
        ask.setAskStateFlag(1);
        ask.setAskDeleteFlag(0);
        
        repository.insertAsk(ask);
        
        if (ask.getAskDetails() != null && !ask.getAskDetails().isEmpty()) {
            for (AskDetailVO detail : ask.getAskDetails()) {
                detail.setAskNo(ask.getAskNo());
                repository.insertAskDetail(detail);
            }
        }
    }
    
    private boolean userExists(String userEmail) {
        return userRepository.findUserByEmail(userEmail) != null;
    }	
	
	//ask 전체 조회
	@Override
	public Page<AskVO> askAll(Pageable pageable, String searchType, String keyword){
		return repository.askAll(pageable, searchType, keyword); //AskRepository에서 askAll 메서드 실행
	}
	//ask 전체 개수 조회
	@Override
	public int count(String searchType, String keyword) {
		return repository.count(searchType, keyword); //AskRepository의 메서드 count 실행
	}

	@Override
	public List<AskVO> myOnedate() {
		return repository.myOnedate();
	}

	@Override
	public List<AskVO> computerPost(int computerNo) {
		return repository.computerPost(computerNo);
	}

	@Override
	public List<AskVO> peripheralPost(int peripheralNo) {
		return repository.peripheralPost(peripheralNo);
	}
}
