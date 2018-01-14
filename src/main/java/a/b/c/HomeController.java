package a.b.c;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.accountVO;
import domain.customVO;
import domain.custom_childVO;
import persistence.customDAO;
import service.customService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	customService serv;
	@Inject
	customDAO dao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeGet(Locale locale, Model model, RedirectAttributes rttr) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		
		String formattedDate = dateFormat.format(date);
	//	System.out.println("controll-vo-"+serv.leftList(vo));
		
	//	rttr.addFlashAttribute("vo",list);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
		
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String homePost(Model model, customVO vo){
		
		String searches="null";
		logger.info("{}", vo);
		model.addAttribute("searches", searches);
		serv.insert(vo);
		return "home";
	}
	
	@RequestMapping(value = "/home2", method = RequestMethod.GET)
	public void test2(){
		
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test(Locale locale, Model model, customVO vo, RedirectAttributes rttr) {
		List<customVO>list=serv.leftList(vo);
		model.addAttribute("customVO_left", vo );
		
		logger.info("test");
		//return "test";
	}
	
	
	@RequestMapping(value = "/left-get", method = RequestMethod.GET)
	public String get(Locale locale, Model model, customVO vo,RedirectAttributes rttr, String searches) {
		System.out.println("vo"+vo);
		
		
		List<customVO>list=serv.leftList(vo);
		System.out.println("list"+list);
		
	//	List<accountVO> avo = serv.searchOne_a(vo);
	//	System.out.println("avo"+avo);
		customVO vo2 = serv.searchOne_c(vo);
		
		List<customVO>postList = serv.searchPost(vo.getAddr1()); 
		List<customVO>countryList = serv.searchCountry(vo.getCountry_kor());
		
		rttr.addFlashAttribute("vo",vo2); //오른쪽 화면의 전체 내용을 보여주는 변수
	//	rttr.addFlashAttribute("accountVO",avo); //오른쪽 하단 거래처 계좌정보
		rttr.addFlashAttribute("customVO_left", list );		 //왼쪽 정보
		rttr.addFlashAttribute("postList",postList); //우편번호와 주소1		
		rttr.addFlashAttribute("countryList",countryList); //국가 한글. 영어
		rttr.addFlashAttribute("searches", searches); //jsp에서 두 개의 창이 뜨는 문제 해결
		logger.info("left-get {}  ",countryList);
		System.out.println("searches "+searches);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/sub", method = RequestMethod.POST)
	public void leftGet(custom_childVO vo, Model model){
		logger.info("left get {} ", vo);
		model.addAttribute("vo",vo);
	}
	
	@RequestMapping(value = "/formTest", method = {RequestMethod.GET, RequestMethod.POST})
	public void leftGet(HttpServletRequest request){
		String t1 = request.getParameter("t1") == null? "":request.getParameter("t1");
		logger.info(t1);
	}
	
}
