package com.project.shop.user.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.user.vo.AddrVO;

@Repository
public class AddrRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "AddrMapper";
	
    public AddrVO getAddress(String userEmail) {
        return template.selectOne(NAME_SPACE + ".getAddress", userEmail);
    }
    
    public List<AddrVO> getAddressesByUserEmail(String userEmail) {
        return template.selectList(NAME_SPACE + ".getAddressesByUserEmail", userEmail);
    }
	
	// 배송주소 등록하는 메서드
	public int myaddrplus(AddrVO vo) {
		return template.insert(NAME_SPACE + ".myaddrplus", vo);
	}
	
	// 배송주소 단 건 조회하는 메서드
	public AddrVO myaddrOne(int addrNo) {
		return template.selectOne(NAME_SPACE + ".myaddrOne", addrNo);
	}
	
	// 배송주소 수정하는 메서드
	public int myaddrModify(AddrVO vo) {
		return template.update(NAME_SPACE+ ".myaddrModify", vo);
	}
	// 배송주소 삭제하는 메서드
	public int myaddrDelete( List<String> arrayParams) {
		return template.update(NAME_SPACE+".myaddrDelete", arrayParams);
	}
	
	// 배송주소 가져오는 메서드
    public List<AddrVO> myaddrlist(AddrVO vo){
		return template.selectList(NAME_SPACE+ ".myaddrlist", vo);
	}

    // 배송주소 기본주소로 업데이트하고 나머지는 일반주소로 업데이트하는 메서드
    public int myaddr1(AddrVO vo) {
    	return template.update(NAME_SPACE+ ".myaddr1", vo);
    }
}
