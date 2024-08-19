package com.project.shop.progress.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.progress.vo.FileVO;

@Repository
public class FileRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "FileMapper";
	
	public int insert(List<FileVO> vo) {
		return template.insert(NAME_SPACE + ".insert", vo);
	}
}
