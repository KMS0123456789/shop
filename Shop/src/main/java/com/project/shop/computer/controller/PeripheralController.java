package com.project.shop.computer.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.computer.repository.PeripheralRepository;
import com.project.shop.computer.service.PeripheralService;
import com.project.shop.computer.vo.PeripheralVO;
import com.project.shop.progress.repository.FileRepository;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.progress.vo.FileVO;
import com.project.shop.user.vo.UserVO;



@Controller
@RequestMapping("/peripheral")
public class PeripheralController {
	
	@Autowired
	private PeripheralService service;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	PeripheralRepository repository;
	
	@Autowired
	AskService askService;
	
	//마우스 전체 조회
	@RequestMapping(value="/mouse.do", method=RequestMethod.GET)
	public String mouse(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 0;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(mouse이기 때문에 0번)
		Page<PeripheralVO> data = service.mouse(pageable, searchType, keyword, peripheralCategory);//data에 service.mouse 값 넣기
		model.addAttribute("mouse", data.getContent());//mouse키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "mouse";//mouse.jsp로 보냄
	}
	
	//키보드 전체 조회
	@RequestMapping(value="/keyboard.do", method=RequestMethod.GET)
	public String keyboard(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 1;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(keyboard이기 때문에 1번)
		Page<PeripheralVO> data = service.keyboard(pageable, searchType, keyword, peripheralCategory);//data에 service.keyboard 값 넣기
		model.addAttribute("keyboard", data.getContent());//keyboard키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "keyboard";//keyboard.jsp로 보냄
	}
	
	//모니터 전체 조회
	@RequestMapping(value="/monitor.do", method=RequestMethod.GET)
	public String monitor(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 2;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(monitor이기 때문에 2번)
		Page<PeripheralVO> data = service.monitor(pageable, searchType, keyword, peripheralCategory);//data에 service.monitor 값 넣기
		model.addAttribute("monitor", data.getContent());//monitor키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "monitor";//monitor.jsp로 보냄
	}
	
	@RequestMapping(value="/peripheral.do/{peripheralNo}", method = RequestMethod.GET)
	public String computerPost(@PathVariable int peripheralNo, Model model, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");

		HashMap<String, Object> map = new HashMap<>();
		map.put("peripheralNo", peripheralNo);
		if(user != null) {
			map.put("email", user.getEmail());
		}
		
		//PeripheralNo에 해당하는 데이터 조회
		PeripheralVO peripheral = service.peripheralPost(map); //컴퓨터에 service.computerPost 값 넣기
		
		List<AskVO> ask = askService.peripheralPost(peripheralNo);
		
		model.addAttribute("peripheral", peripheral); //포워딩할 때 키 computer에 값 넣어 보내기
		model.addAttribute("ask", ask); //포워딩할 때 키 opt에 값 넣어 보내기
		return "peripheralPost";
	}
	
	@RequestMapping(value="/peripheralwrite.do", method=RequestMethod.GET)
	public String peripheralwrite() {
		return "peripheralwrite";
	}
	@RequestMapping(value="/peripheralwrite.do", method=RequestMethod.POST)
	public String peripheralwriteOk(PeripheralVO peripheralVO, 
	        @RequestParam("file") MultipartFile[] files) {
		
		repository.peripheralInsert(peripheralVO);
	    int result =peripheralVO.getPeripheralNo();
	    
	    if(result > 0) {
	        String uploadDir = servletContext.getRealPath("/uploads/");
	        File dir = new File(uploadDir);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
	        
	        List<FileVO> fileList = new ArrayList<>();
	        for(MultipartFile file : files) {
	            if(!file.isEmpty()) {
	                String originFileName = file.getOriginalFilename();
	                String uniqueFileName = UUID.randomUUID().toString() + "_" + originFileName;
	                String filePath = "/uploads/" + uniqueFileName;
	                
	                try {
	                    file.transferTo(new File(uploadDir + uniqueFileName));
	                    FileVO fileVO = new FileVO();
	                    fileVO.setPeripheralNo(peripheralVO.getPeripheralNo());
	                    fileVO.setFileName(originFileName);
	                    fileVO.setFilePath(filePath);
	                    fileVO.setFileSize(String.valueOf(file.getSize()));
	                    fileList.add(fileVO);
	                } catch (Exception e) {
	                    e.printStackTrace();

	                }
	            }
	        }

	        return "redirect:/peripheral/peripheral.do/" + peripheralVO.getPeripheralNo();
	    } else {
	        return "redirect:/user/manager.do";
	    }
	}
	
	//마우스 가격 높은순 조회
	@RequestMapping("/mouseHighPrice.do")
	public String mouseHighPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 0;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(mouse이기 때문에 0번)
		Page<PeripheralVO> data = service.mouseHighPrice(pageable, searchType, keyword, peripheralCategory);//data에 service.mouseHighPrice 값 넣기
		model.addAttribute("mouse", data.getContent());//mouse키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "mouse";//mouse.jsp로 보냄
	}
	
	//마우스 가격 낮은순 조회
	@RequestMapping("/mouseLowPrice.do")
	public String mouseLowPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 0;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(mouse이기 때문에 0번)
		Page<PeripheralVO> data = service.mouseLowPrice(pageable, searchType, keyword, peripheralCategory);//data에 service.mouseLowPrice 값 넣기
		model.addAttribute("mouse", data.getContent());//mouse키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "mouse";//mouse.jsp로 보냄
	}
	
	//키보드 가격 높은순 조회
	@RequestMapping("/keyboardHighPrice.do")
	public String keyboardHighPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 1;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(keyboard이기 때문에 1번)
		Page<PeripheralVO> data = service.keyboardHighPrice(pageable, searchType, keyword, peripheralCategory);//data에 service.keyboardHighPrice 값 넣기
		model.addAttribute("keyboard", data.getContent());//keyboard키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "keyboard";//keyboard.jsp로 보냄
	}
	
	//키보드 가격 낮은순 조회
	@RequestMapping("/keyboardLowPrice.do")
	public String keyboardLowPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 1;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(keyboard이기 때문에 1번)
		Page<PeripheralVO> data = service.keyboardLowPrice(pageable, searchType, keyword, peripheralCategory);//data에 service.keyboardLowPrice 값 넣기
		model.addAttribute("keyboard", data.getContent());//keyboard키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "keyboard";//keyboard.jsp로 보냄
	}
	
	//모니터 가격 높은순 조회
	@RequestMapping("/monitorHighPrice.do")
	public String monitorHighPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 2;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(monitor이기 때문에 2번)
		Page<PeripheralVO> data = service.monitorHighPrice(pageable, searchType, keyword, peripheralCategory);//data에 service.monitorHighPrice 값 넣기
		model.addAttribute("monitor", data.getContent());//monitor키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "monitor";//monitor.jsp로 보냄
	}
	
	//마우스 가격 낮은순 조회
	@RequestMapping("/monitorLowPrice.do")
	public String monitorLowPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20);//한 페이지에 뜰 게시물 갯수(20개)
		int peripheralCategory = 2;//count 조회시 필요하기 때문에 카테고리를 지정해서 보냄(monitor이기 때문에 2번)
		Page<PeripheralVO> data = service.monitorLowPrice(pageable, searchType, keyword, peripheralCategory);//data에 service.monitorLowPrice 값 넣기
		model.addAttribute("monitor", data.getContent());//monitor키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page);//currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages());//totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10);//pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		
		return "monitor";//monitor.jsp로 보냄
	}
}
	


	
		

