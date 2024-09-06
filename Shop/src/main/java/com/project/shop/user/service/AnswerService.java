package com.project.shop.user.service;

import com.project.shop.user.vo.AnswerVO;
import com.project.shop.user.vo.QuestionVO;


public interface AnswerService {
	//QnA 답변
	int answerwrite(AnswerVO vo);
}
