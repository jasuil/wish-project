package persistence;


import java.util.ArrayList;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import domain.accountVO;
import domain.customVO;

@Repository
public class customDAOImpl implements customDAO {

	private static final Logger logger = LoggerFactory.getLogger(customDAOImpl.class);
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "custom";
	
	public customDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void insert(customVO vo) {
		// TODO Auto-generated method stub
		session.insert(namespace+".input", vo);
	}

	@Override
	public customVO read(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(customVO vo) {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
	}

	@Override
	public String remove(String busi_num) {
		// TODO Auto-generated method stub
		String check = "";//  둘 다 삭제가 된 것임
		
	    if(session.delete(namespace+".delete_custom", busi_num) == 0)
	    	check +=" custom failed";
	    if(session.delete(namespace+".delete_account", busi_num) == 0)
	    	check +=" account failed";
	    // delete is returned 0 or 1
		
		return check;
	}

	@Override
	public void modify() {
		// TODO Auto-generated method stub

	}
	
	@Override
	public customVO select(customVO vo) {
		
		vo.setBusi_num(vo.getBusi_num().trim()); //문자열의 앞,뒤 공백만 있을 경우를 대비하여 공백은 모조리 삭제...
		vo.setCustom(vo.getCustom().trim());
		if((vo.getBusi_num().length()<=0 || vo.getBusi_num() == null) && (vo.getCustom().length()<=0 || vo.getCustom() == null))
			return null;
		
		return session.selectOne(namespace+".select", vo);
	}

	@Override
	public List<customVO> listLeft(customVO vo) {
		// TODO Auto-generated method stub
		
		vo.setBusi_num(vo.getBusi_num().trim()); //문자열의 앞,뒤 공백만 있을 경우를 대비하여 공백은 모조리 삭제...
		vo.setCustom(vo.getCustom().trim());
		
		int length = vo.getCustom().length();
		
		if( vo.getCustom().equals("") || vo.getCustom().length() <= 0)
			vo.setCustom("null");
		if( vo.getBusi_num().equals("") || vo.getBusi_num().length() <= 0)
			vo.setBusi_num("null");
		
		logger.info("listLeft {}", vo.getCustom().length());
		List<customVO> list = new <customVO>ArrayList();
		
		if((vo.getBusi_num().length()<=0 || vo.getBusi_num() == null) && (vo.getCustom().length()<=0 || vo.getCustom() == null))
			return list;
		
		System.out.println("result:"+session.selectList(namespace+".search_left", vo));
		return session.selectList(namespace+".search_left", vo);
	}

	@Override
	public List<customVO> listPost(String addr1) {
		// TODO Auto-generated method stub
		logger.info("dao addr1- "+addr1);
		addr1.trim();
		if(  addr1 == null || addr1.length()<=0)
			return null;

		logger.info("{}",session.selectList(namespace+".search_post", addr1));
		return session.selectList(namespace+".search_post", addr1);
	}

	@Override
	public List<customVO> listCountry(String country){
		country.trim();
		System.out.println("country-"+country);
		if(country == null || country.length()<=0)
			return null;
		
		System.out.println("dao cont list"+session.selectList(namespace+".search_country", country));
		return session.selectList(namespace+".search_country", country);
	}
	

	
	@Override
	public customVO searchOne_c(customVO vo){
		return session.selectOne(namespace+".search_one_c", vo);
	}
	
	@Override
	public List<accountVO> searchOne_a(String busi_num){
		busi_num.trim();
		if(busi_num == null || busi_num.length()<=0)
			return null;
		
		System.out.println("dao-searchOne_a="+session.selectList(namespace+".search_one_a", busi_num));
		return session.selectList(namespace+".search_one_a", busi_num);
	}

	@Override
	public String isExisted(String busi_num){
		
		System.out.println(busi_num+session.selectOne(namespace+".isExisted", busi_num));
		
		 if(session.selectOne(namespace+".isExisted", busi_num) == null)
			 return "false";
		 else
			 return "true";		
	}
	
	@Override
	public String accountisExisted(String account_num){
		logger.info("{} account_num"+account_num,account_num+session.selectOne(namespace+".accountIsExisted", account_num));
		 if(session.selectOne(namespace+".accountIsExisted", account_num) == null)
			 return "none";
		 else
			 return "already";		
	}
	
	@Override
	public void insert_account(accountVO vo){
		session.insert(namespace+".input_account", vo);
	}
	
	@Override
	public String delete_account_alone(String account_num){
	String check = "";//  둘 다 삭제가 된 것임
		
	    if(session.delete(namespace+".delete_account_alone", account_num) == 0)
	    	check +="account delete failed";
	
	    // delete is returned 0 or 1
		
		return check;
	}

	
	@Override
	public String update_account(accountVO vo){
	String check = "";//  둘 다 삭제가 된 것임
		
		logger.info("ipdata account {}"+vo);
		//System.out.println(session.update(namespace+".update_account", vo));
	    if(session.update(namespace+".update_account", vo) == 0)
	    	check +="account update failed";
	    // delete is returned 0 or 1
		
		return check;
	}
	

}
