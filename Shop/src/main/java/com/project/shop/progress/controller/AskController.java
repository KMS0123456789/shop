package com.project.shop.progress.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.shop.progress.service.AskDetailService;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.service.CartService;
import com.project.shop.progress.vo.AskDetailVO;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.user.vo.UserVO;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService service;
	
	@Autowired
	private AskDetailService detailService;
	
    @Autowired
    private CartService cartService;
	
    @PostMapping(value = "/completePay.do", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> completePay(
    		@RequestBody List<AskVO> askList, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        Map<String, Object> response = new HashMap<>();
        if (user == null) {
            response.put("status", 400);
            response.put("message", "로그인이 필요합니다.");
            return ResponseEntity.badRequest().body(response);
        }
        try {
            for (AskVO ask : askList) {
                ask.setAskUser(user.getEmail());
                service.completePay(ask);  
                if (ask.getAskDetails() != null) {
                    for (AskDetailVO detail : ask.getAskDetails()) {
                        detail.setAskNo(ask.getAskNo());  
                        detail.setAskDetailUser(user.getEmail());
                        detailService.completePay(detail);
                    }
                }
            }
            cartService.clearCart(user.getEmail());
            response.put("status", 200);
            response.put("message", "결제가 완료되었습니다.");
            response.put("askList", askList);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", 400);
            response.put("message", "결제 실패: " + e.getMessage());
            response.put("errorDetails", e.getClass().getSimpleName());
            return ResponseEntity.badRequest().body(response);
        }
    }
	
    @GetMapping("/orderComplete.do")
    public String orderComplete(Model model, AskVO askvo, AskDetailVO advo) {
        AskVO order = service.selectlastone();
        if (order != null) {
            askvo.setAskNo(order.getAskNo());
            advo.setAskNo(order.getAskNo());
            
            List<AskVO> askList = service.getAskById(askvo);
            List<AskDetailVO> askDetails = detailService.getAskDetailsByAskNo(advo);
            
            if (!askList.isEmpty() && askDetails != null) {
                
                model.addAttribute("ask", order);
                model.addAttribute("askList", askList);
                model.addAttribute("askDetails", askDetails);
                return "orderComplete";
            }
        }
        
        model.addAttribute("error", "주문 정보를 불러오는데 실패했습니다.");
        return "error";
    }	
	
	@RequestMapping(value = "/myorder_cancel.do", method = RequestMethod.GET)
    public String myorder_cancel() {
        return "myorder_cancel";
    }

    @RequestMapping(value = "/myorder.do", method = RequestMethod.GET)
    public String myorder() {
        return "myorder";
    }
    
    @RequestMapping(value="/computerBuy.do", method = RequestMethod.POST)
    public String computerBuy(AskVO avo, AskDetailVO advo, Model model) {
    	service.computerBuy(avo);
    	advo.setAskNo(avo.getAskNo());
    	detailService.computerBuy(advo);
    	avo.setAskNo(avo.getAskNo());
    	AskVO ask = service.computerBuySelect(avo);
    	AskDetailVO detail = detailService.computerBuySelect(advo);
    	model.addAttribute("ask", ask);
    	model.addAttribute("detail",detail);
    	return "computerBuy";
    }
    
    @RequestMapping(value="/completeComputerBuy.do", method = RequestMethod.POST)
    public String completeComputerBuy(AskVO vo) {
    	service.completeComputerBuy(vo);
    	return "orderCompleteComputer";
    }
    
    @RequestMapping(value="/orderCompleteComputer.do")
    public String orderCompleteComputer(@RequestParam("askNo") int askNo, 
    		Model model, AskDetailVO vo, HttpSession session) {
    	UserVO user = (UserVO)session.getAttribute("user");
    	vo.setAskDetailUser(user.getEmail());
    	vo.setAskNo(askNo);
    	AskDetailVO detail = detailService.orderCompleteComputer(vo);
    	model.addAttribute("detail",detail);
    	return "orderCompleteComputer";
    }
    
    
    @RequestMapping(value="/peripheralBuy.do", method = RequestMethod.POST)
    public String peripheralBuy(AskVO avo, AskDetailVO advo, Model model) {
    	service.peripheralBuy(avo);
    	advo.setAskNo(avo.getAskNo());
    	detailService.peripheralBuy(advo);
    	avo.setAskNo(avo.getAskNo());
    	AskVO ask = service.peripheralBuySelect(avo);
    	AskDetailVO detail = detailService.peripheralBuySelect(advo);
    	model.addAttribute("ask", ask);
    	model.addAttribute("detail",detail);
    	return "peripheralBuy";
    }
    
    @RequestMapping(value="/completePeripheralBuy.do", method = RequestMethod.POST)
    public String completeperipheralBuy(AskVO vo) {
    	service.completePeripheralBuy(vo);
    	return "orderCompletePeripheral";
    }
    
    @RequestMapping(value="/orderCompletePeripheral.do")
    public String orderCompletePeripheral(@RequestParam("askNo") int askNo, 
    		Model model, AskDetailVO vo, HttpSession session) {
    	UserVO user = (UserVO)session.getAttribute("user");
    	vo.setAskDetailUser(user.getEmail());
    	vo.setAskNo(askNo);
    	AskDetailVO detail = detailService.orderCompletePeripheral(vo);
    	model.addAttribute("detail",detail);
    	return "orderCompletePeripheral";
    }
    // 구매확정
    @RequestMapping(value = "/buyOk.do", method = RequestMethod.GET)
    public String buyOk(AskVO vo , Model model, int askNo) {
    	
    	System.out.println(askNo);
    	int buyOk = service.buyOk(vo);
    	
    	if(buyOk > 0) {
    		return "redirect:/ask/myorder.do";
    	}else {
    		return "redirect:/ask/myorder.do";
    	}
    }
    @RequestMapping(value = "/askStateModify.do", method = RequestMethod.GET)
    public String askStateModify(AskVO vo , Model model, int askNo) {
    	
    	int askStateModify = service.askStateModify(vo);
    	
    	if(askStateModify > 0) {
    		return "redirect:/askdetail/managerdelivery.do";
    	}else {
    		return "redirect:/askdetail/managerdelivery.do";
    	}
    }
    
    @RequestMapping(value = "/deliveryComplete.do", method = RequestMethod.GET)
    public String deliveryComplete(AskVO vo , Model model, int askNo) {
    	
    	int deliveryComplete = service.deliveryComplete(vo);
    	
    	if(deliveryComplete > 0) {
    		return "redirect:/askdetail/managerdelivery.do";
    	}else {
    		return "redirect:/askdetail/managerdelivery.do";
    	}
    }
    
    // 주문 취소
    @RequestMapping(value = "/cancelOk.do", method = RequestMethod.GET)
    public String cancelOk(AskVO vo , Model model, int askNo) {
    	
    	System.out.println(askNo);
    	int cancelOk = service.cancelOk(vo);
    	
    	if(cancelOk > 0) {
    		return "redirect:/ask/myorder_cancel.do";
    	}else {
    		return "redirect:/ask/myorder_cancel.do";
    	}
    }
    
    // 상품 교환
    @RequestMapping(value = "/changeOk.do", method = RequestMethod.GET)
    public String changeOk(AskVO vo , Model model, int askNo) {
    	
    	System.out.println(askNo);
    	int changeOk = service.changeOk(vo);
    	
    	if(changeOk > 0) {
    		return "redirect:/ask/myorder_cancel.do";
    	}else {
    		return "redirect:/ask/myorder_cancel.do";
    	}
    }
    
    @RequestMapping(value = "/changing.do", method = RequestMethod.GET)
    public String changing(AskVO vo) {
    	
    	int changing = service.changing(vo);
    	
    	if(changing > 0) {
    		return "redirect:/askdetail/changelist.do";
    	}else {
    		return "redirect:/user/manager.do";
    	}
    }
    
    @RequestMapping(value = "/changecomplete.do", method = RequestMethod.GET)
    public String changecomplete(AskVO vo) {
    	
    	int changecomplete = service.changecomplete(vo);
    	
    	if(changecomplete > 0) {
    		return "redirect:/askdetail/changelist.do";
    	}else {
    		return "redirect:/user/manager.do";
    	}
    }
}
