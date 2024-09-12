package com.project.shop.progress.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.shop.progress.repository.AskDetailRepository;
import com.project.shop.progress.repository.AskRepository;
import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.user.repository.UserRepository;

@Service
public class AskServiceImpl implements AskService{
	
	@Autowired
	private AskRepository repository;
	
	@Autowired
	private AskDetailRepository askDetailRepository;

    @Autowired
    private UserRepository userRepository; 
    

    @Override
    @Transactional
    public void completePay(AskVO ask) throws Exception {
        repository.completePay(ask);
    }
    
    private boolean userExists(String userEmail) {
        return userRepository.findUserByEmail(userEmail) != null;
    }	
	
    @Override
    public AskVO selectlastone() {
    	return repository.selectlastone();
    }
    
    @Override
    public AskVO getAskById(AskVO vo) {
        return repository.getAskById(vo);
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

	@Override
	public int computerBuy(AskVO avo) {
		return repository.computerBuy(avo);
	}

	@Override
	public AskVO computerBuySelect(AskVO avo) {
		return repository.computerBuySelect(avo);
	}

	@Override
	public int completeComputerBuy(AskVO vo) {
		return repository.completeComputerBuy(vo);
	}
	
	@Override
	public int peripheralBuy(AskVO avo) {
		return repository.peripheralBuy(avo);
	}

	@Override
	public AskVO peripheralBuySelect(AskVO avo) {
		return repository.peripheralBuySelect(avo);
	}

	@Override
	public int completePeripheralBuy(AskVO vo) {
		return repository.completePeripheralBuy(vo);
	}
	
	// 구매확정으로 업데이트 
	@Override
	public int buyOk(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.buyOk(vo);
	}
	
	@Override
	public int askStateModify(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.askStateModify(vo);
	}
	
	@Override
	public int deliveryComplete(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.deliveryComplete(vo);
	}
	
	// 주문취소로 업데이트
	@Override
	public int cancelOk(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.cancelOk(vo);
	}

	@Override
	public int changeOk(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.changeOk(vo);
	}
	
	@Override
	public int changing(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.changing(vo);
	}
	
	@Override
	public int changecomplete(AskVO vo) {
		// TODO Auto-generated method stub
		return repository.changecomplete(vo);
	}
}
