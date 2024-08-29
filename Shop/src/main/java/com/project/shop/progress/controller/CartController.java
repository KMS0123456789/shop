package com.project.shop.progress.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.shop.progress.service.CartService;
import com.project.shop.progress.vo.CartVO;
import com.project.shop.user.service.AddrService;
import com.project.shop.user.vo.AddrVO;
import com.project.shop.user.vo.UserVO;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;
	
    @Autowired
	private AddrService addrService;
    
    @GetMapping("/view.do")
    public String viewCart(@ModelAttribute UserVO vo, HttpSession session, Model model) {
    	UserVO user = (UserVO) session.getAttribute("user");
        
        List<CartVO> cartItems = service.getCartItemsWithDetails(user.getEmail());
        model.addAttribute("cartItems", cartItems);
   
        return "cart";
    }
    
    @GetMapping("/order.do")
    public String viewOrder(@ModelAttribute UserVO vo, HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");

        // 장바구니 항목 조회
        List<CartVO> cartItems = service.getCartItemsByUser(user.getEmail());
        model.addAttribute("cartItems", cartItems);
        
        // 단일 주소 조회
        AddrVO addr = addrService.getAddress(user.getEmail());
        model.addAttribute("addr", addr);

        return "order";
    }
    
    @ResponseBody
    @GetMapping("/addr.do")
    public List<AddrVO> addressList(HttpSession session) {
    	UserVO user = (UserVO) session.getAttribute("user");
    	List<AddrVO> addressList = addrService.getAddressesByUserEmail(user.getEmail());
    	
    	return addressList;
    }
      
    @GetMapping("/orderComplete.do")
    public String orderComplete() {
        return "orderComplete";
    }
	
	//완제품 상세페이지에서 장바구니 담기
	@RequestMapping(value="/cartComputer.do", method=RequestMethod.POST)
	public String cartComputer(CartVO vo,
			@RequestParam("computerNo") int computerNo){
		//CartService의 메서드 cartComputer 실행 CartVO vo 파라미터로 같이 보냄
		service.cartComputer(vo);
		//해당 상세페이지로 리다이렉트
		//리다이렉트 하기 위해서 computerNo 받아옴
		return "redirect:/computer/computer.do/"+computerNo;
	}
	
	//주변기기 상세페이지에서 장바구니 담기
	@RequestMapping(value="/cartPeripheral.do", method=RequestMethod.POST)
	public String cartPeripheral(CartVO vo,
			@RequestParam("peripheralNo") int peripheralNo){
		//CartService의 메서드 cartPeripheral실행 CartVO vo 파라미터로 같이 보냄
		service.cartPeripheral(vo);
		//해당 상세페이지로 리다이렉트
		//리다이렉트 하기 위해서 computerNo 받아옴
		return "redirect:/peripheral/peripheral.do/"+peripheralNo;
	}
}
