package com.project.shop.computer.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.project.shop.computer.vo.OptVO;

//옵션 전체 조회
public interface OptService {
	List<OptVO> computerPost();
	
	//opt 등록
	int optionInsert(OptVO vo);
	
	//opt 목록 조회
	Page<OptVO> optList(Pageable pageable, String searchType, String keyword);
	
	//opt 전체 개수 조회
	int optCount(String searchType, String keyword);
	
	//opt 삭제
	int optDelete(OptVO vo);
}
