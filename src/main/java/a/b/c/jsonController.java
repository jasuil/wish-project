package a.b.c;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import domain.accountVO;
import domain.customVO;
import service.customService;

@RestController
@RequestMapping("/json")
public class jsonController {
	
	private static final Logger logger = LoggerFactory.getLogger(jsonController.class);
	@Inject
	customService serv;
	
	@RequestMapping(value="/left", method=RequestMethod.POST)
	public ResponseEntity<List<customVO>>  leftList(@RequestBody customVO vo){
		
		System.out.println("rest"+vo);
		 ResponseEntity<List<customVO>> entity  = null;
		 try{
			 entity = new ResponseEntity<>(serv.leftList(vo), HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }
			logger.info("left-{}",entity);
		//	System.out.println(entity);
		return entity;
	}
	
	@RequestMapping(value="/right", method=RequestMethod.POST)
	public ResponseEntity<customVO>  right(@RequestBody customVO vo){
		
	
		 ResponseEntity<customVO> entity  = null;
		 try{
			 entity = new ResponseEntity<>(serv.select(vo), HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }
		 logger.info("right-{}",entity);
		
		return entity;
	}
	
	@RequestMapping(value="/post", method=RequestMethod.POST)
	public  ResponseEntity<List<customVO>> Post(@RequestBody customVO vo){
		
		logger.info("post search {}", vo);
		
		 ResponseEntity<List<customVO>> entity  = null;
		 try{
			 entity = new ResponseEntity<>(serv.searchPost(vo.getAddr1()), HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }
		 logger.info("{}", entity);
		return entity;
	}
	
	@RequestMapping(value="/country", method=RequestMethod.POST)
	public  ResponseEntity<List<customVO>> country(@RequestBody customVO vo){
		
		logger.info("country search {}", vo);
		
		 ResponseEntity<List<customVO>> entity  = null;
		 try{
			 entity = new ResponseEntity<>(serv.searchCountry(vo.getCountry_kor()), HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }
		 logger.info("{}", entity);
		return entity;
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public ResponseEntity<String> homePost(@RequestBody customVO vo) {
		
		 logger.info("input post {}", vo);
		
		//사업자번호가 존재하는지 판단, false or true
		String isExisted;
		ResponseEntity<String> entity  = null;
		
		 try{
			 
			 isExisted = serv.isExisted(vo.getBusi_num());
			 entity = new ResponseEntity<>(isExisted, HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("input post {}", entity);
		return entity;
	}

	@RequestMapping(value = "/input", method = RequestMethod.PATCH)
	public ResponseEntity<String> homePatch(@RequestBody customVO vo) {
		 logger.info("homePatch {}", vo);
			
		 ResponseEntity<String> entity  = null;
		 try{
			 Thread.sleep(1000);
			 serv.update(vo);
			 entity = new ResponseEntity<>("good", HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("homePatch {}", entity);
		return entity;
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.PUT)
	public ResponseEntity<String> homePut(@RequestBody customVO vo) {
				
		 logger.info("input Put {}", vo);
		
		 ResponseEntity<String> entity  = null;
		 try{
			 Thread.sleep(1000);
			 serv.insert(vo);
			 entity = new ResponseEntity<>("good", HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("input Put {}", entity);
		return entity;
	}

	@RequestMapping(value = "/accountList", method = RequestMethod.POST)
	public ResponseEntity<List<accountVO>> rightGet(@RequestBody accountVO vo) {
				
		 logger.info("account get {}", vo.getBusi_num());
		
		 ResponseEntity<List<accountVO>> entity  = null;
		 try{			 
			 entity = new ResponseEntity<>( serv.searchOne_a(vo.getBusi_num()), HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }
		 logger.info("account get {}", entity);
		return entity;
	}
	
	
	@RequestMapping(value = "/right/{busi_number}", method = RequestMethod.GET)
	public ResponseEntity<List<accountVO>> rightGet(@PathVariable ("busi_number") String busi_num) {
				
		 logger.info("account get {}", busi_num);
		
		 ResponseEntity<List<accountVO>> entity  = null;
		 try{			 
			 entity = new ResponseEntity<>( serv.searchOne_a(busi_num), HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }
		 logger.info("account get {}", entity);
		return entity;
	}
	
	@RequestMapping(value = "/right/{busi_num}", method = RequestMethod.DELETE)
	public ResponseEntity delete(@PathVariable("busi_num") String busi_num){
		
		 String check = "";
		 ResponseEntity<String> entity  = null;
		 try{
			 check = serv.delete(busi_num);
			 
			 entity = new ResponseEntity<>(check, HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("homePut {}", entity);
		return entity;	
	}
	
	////////////////////////계좌정보 테이블 관련/////////////////////////////////////////
	
	//저장시 데이더가 있는지 조회
	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public ResponseEntity<String> accountPost(@RequestBody accountVO vo) {
		
		 logger.info("account post {}", vo);
		 
		String isExisted;
		ResponseEntity<String> entity  = null;
		 try{
			 isExisted = serv.accountisExisted(vo.getAccount_num());
			 entity = new ResponseEntity<>(isExisted, HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("account post {}", entity);
		return entity;
	}

	//삽입
	@RequestMapping(value = "/account", method = RequestMethod.PUT)
	public ResponseEntity<String> accountPut(@RequestBody accountVO vo){
		logger.info("account insert {}", vo);
		
		 ResponseEntity<String> entity  = null;
		 try{
			 Thread.sleep(1000);
			 serv.insert_account(vo);
			 entity = new ResponseEntity<>("good", HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("account insert{}", entity);
		return entity;
	}
	
	//수정
	@RequestMapping(value = "/account", method = RequestMethod.PATCH)
	public ResponseEntity<String> accountPatch(@RequestBody accountVO vo){
		logger.info("account patch{}", vo);
		
		 ResponseEntity<String> entity  = null;
		 try{
			 Thread.sleep(1000);
			 serv.update_account(vo);
			 entity = new ResponseEntity<>("good", HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("account patch{}", entity);
		return entity;
	}
	
	//삭제
	@RequestMapping(value = "/account", method = RequestMethod.DELETE)
	public ResponseEntity<String> accountDelete(@RequestBody accountVO vo){
		logger.info("account delete {}", vo);
		
		 ResponseEntity<String> entity  = null;
		 try{
			 Thread.sleep(1000);
			 serv.delete_account_alone(vo.getAccount_num());
			 entity = new ResponseEntity<>("good", HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>("bad",HttpStatus.BAD_REQUEST);
		 }
		 logger.info("account delete {}", entity);
		return entity;
	}
	
	//연습용
		@RequestMapping(value = "/input/{page}", method = RequestMethod.GET)
		public String m(@PathVariable("page") String page){
			
			customVO vo= new customVO();
			vo.setBusi_num(page);
			vo = serv.select(vo);
			
			Date d = new Date();
		//	d =vo.getRegi_info_date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String to = transFormat.format(d);
			System.out.println(to);
			System.out.println(d);
		
			return "{\"date\": \""+to+"\"}";			
		}
		
		@RequestMapping(value="/sub", method = RequestMethod.POST)
		public customVO k(customVO vo){
			
			logger.info("k {}", vo);
			return vo;
		}
		
	/*
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody replyVO vo){
		
		ResponseEntity<String> entity = null;
		try{
			serv.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<replyVO>> list(
			@PathVariable("bno") Integer bno){
				
	 ResponseEntity<List<replyVO>> entity  = null;
	 try{
		 entity = new ResponseEntity<>(serv.listReply(bno), HttpStatus.OK);
	 }catch(Exception e){
		 e.printStackTrace();
		 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	 }
	 
	 return entity;	 
	}

	@RequestMapping(value = "/{rno}",method ={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(
			@PathVariable("rno") Integer rno,
			@RequestBody replyVO vo){
		
		ResponseEntity<String> entity = null;
		try{
			vo.setRno(rno);
			serv.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(
			@PathVariable("rno") Integer rno){
		
		ResponseEntity<String> entity = null;
		try{
			serv.removeReply(rno);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);			
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<>(
						e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{bno}/{page}",  method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("bno") Integer bno,
			@PathVariable("page") Integer page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try{
			listCri cri = new listCri();
			
			cri.setCurrentPage(page);
			cri.setTotalCount(serv.count(bno)); //bno에 맞는 댓글 갯수를 파악한다.
			
			pageGroupCri pageMaker = new pageGroupCri();
			pageMaker.setCri(cri);
			System.out.println("bno-"+bno+"pageMaker- "+pageMaker);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<replyVO> list = serv.listReplyPage(bno, cri);
			
			map.put("list", list);
			
		//	int replyCount = serv.count(bno);
		//	pageMaker.getCri().setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	*/
	public jsonController() {
		// TODO Auto-generated constructor stub
	}

}
