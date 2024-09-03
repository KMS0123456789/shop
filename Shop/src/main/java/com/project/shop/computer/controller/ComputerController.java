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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.computer.repository.ComputerRepository;
import com.project.shop.computer.service.ComputerService;
import com.project.shop.computer.service.OptService;
import com.project.shop.computer.vo.ComputerVO;
import com.project.shop.computer.vo.OptVO;
import com.project.shop.progress.repository.FileRepository;
import com.project.shop.progress.service.AskService;
import com.project.shop.progress.vo.AskVO;
import com.project.shop.progress.vo.FileVO;
import com.project.shop.user.vo.UserVO;

@Controller
@RequestMapping("/computer")
public class ComputerController {
	
	@Autowired
	private ComputerService service;
	
	@Autowired
	private OptService optService;
	
	@Autowired
	ComputerRepository repository;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	AskService askService;
	
	@Autowired
	FileRepository filerepository;
	
	//완제품 전제 조회
	@RequestMapping(value="/computer.do", method=RequestMethod.GET)
	public String computer(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20); //한 페이지에 뜰 게시물 갯수(20개)
		Page<ComputerVO> data = service.computer(pageable, searchType, keyword);//data에 service.computer 값 넣기
		model.addAttribute("computer", data.getContent()); //computer키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return "computer"; //computer.jsp로 보냄
	}
	
	//완제품 단건 조회
	@RequestMapping(value="/computer.do/{computerNo}", method = RequestMethod.GET)
	public String computerPost(@PathVariable int computerNo, Model model, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");

		HashMap<String, Object> map = new HashMap<>();
		map.put("computerNo", computerNo);
		if(user != null) {
			map.put("email", user.getEmail());
		}
		
		//computerNo에 해당하는 데이터 조회
		ComputerVO computer = service.computerPost(map);
		//컴퓨터에 service.computerPost 값 넣기
		List<OptVO> opt = optService.computerPost();
		//opt에 optService.computerPost 값 넣기 
		List<AskVO> ask = askService.computerPost(computerNo);
		//computer 테이블과 opt 테이블은 foreign 키 관계가 아니므로 join을 할 수가 없음
		//select 쿼리를 각각의 mapper에서 한 번 씩 한 후 값을 가져와 포워딩 할 때 같이 보내준다.
		model.addAttribute("computer", computer); //포워딩할 때 키 computer에 값 넣어 보내기
		model.addAttribute("opt", opt); //포워딩할 때 키 opt에 값 넣어 보내기
		model.addAttribute("ask", ask); //포워딩할 때 키 opt에 값 넣어 보내기
		
		return "computerPost";
	}
	
	@RequestMapping(value="/computerwrite.do", method=RequestMethod.GET)
	public String computerwrite() {
		return "computerwrite";
	}
	@RequestMapping(value="/computerwrite.do", method=RequestMethod.POST)
	public String computerwriteOk(ComputerVO computerVO,
			@RequestParam("file") MultipartFile[] files) {
		
		repository.computerInsert(computerVO);
		int result = computerVO.getComputerNo();
		
		if(result > 0) {
//			String uploadDir = servletContext.getRealPath("/uploads/");
			String uploadDir = "D:\\CteamTwo\\Shop\\src\\main\\webapp\\uploads\\";
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
	            	fileVO.setComputerNo(computerVO.getComputerNo()); //filevo에 있는 ComputerNo에 computerVO.getComputerNo()값을 넣어주기
	            	fileVO.setFileName(originFileName); 	//filevo에 있는 FileName에 originFileName값을 넣어주기
                    fileVO.setFilePath(filePath);		//filevo에 있는 FilePath에 filepath값 넣어주기
                    fileVO.setFileSize(String.valueOf(file.getSize()));
                    fileList.add(fileVO);
                } catch (Exception e) {
                    e.printStackTrace();		// 파일 업로드 실패 시 처리 (예: 에러 메시지 설정)	            
				}
			}
		}
			 if(!fileList.isEmpty()) {
				 filerepository.computerwriteOk(fileList);
		        }

			return "redirect:/computer/computer.do/" + computerVO.getComputerNo(); //성공 시 /computer/computer.do/" + 생성된 ComputerNO로 이동한다
		}else {
		        return "redirect:/user/manager.do"; //실패시 /user/manager.do로 이동
		}
	}
	
	@RequestMapping(value="/computerHighPrice.do", method=RequestMethod.GET)
	public String computerHighPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20); //한 페이지에 뜰 게시물 갯수(20개)
		Page<ComputerVO> data = service.computerHighPrice(pageable, searchType, keyword);//data에 service.computerHighPrice 값 넣기
		model.addAttribute("computer", data.getContent()); //computer키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return "computer"; //computer.jsp로 보냄
	}
	
	@RequestMapping(value="/computerLowPrice.do", method=RequestMethod.GET)
	public String computerLowPrice(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 20); //한 페이지에 뜰 게시물 갯수(20개)
		Page<ComputerVO> data = service.computerLowPrice(pageable, searchType, keyword);//data에 service.computerLowPrice 값 넣기
		model.addAttribute("computer", data.getContent()); //computer키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return "computer"; //computer.jsp로 보냄
	}
	
	@RequestMapping(value="/search.do", method=RequestMethod.GET)
	public String search(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="keyword", required=false) String keyword) {
		Pageable pageable = PageRequest.of(page-1, 20); //한 페이지에 뜰 게시물 갯수(20개)
		Page<ComputerVO> data = service.search(pageable, keyword);//data에 service.search 값 넣기
		model.addAttribute("search", data.getContent()); //search키에 조회할 페이지 정보 넣어 보내기
		model.addAttribute("currentPage", page); //currentPage 키에 페이지 수 넣어 보내기
		model.addAttribute("totalPage", data.getTotalPages()); //totalPage 키에 총 페이지 수 넣어 보내기
		model.addAttribute("pageSize", 10); //pageSize 키에 페이징 기능 최대 버튼 수 (10개) 보내기
		return "search";
	}
	
}

