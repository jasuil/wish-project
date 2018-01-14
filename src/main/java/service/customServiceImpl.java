package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import domain.accountVO;
import domain.customVO;
import persistence.boardDAO;
import persistence.customDAO;

@Service
public class customServiceImpl implements customService {

	@Inject
	private customDAO dao;
	@Inject
	private boardDAO dao2;
	
	public customServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<customVO> leftList(customVO vo) {
		// TODO Auto-generated method stub
		List<customVO> list = dao.listLeft(vo);
		return list;
	}
	@Override
	public customVO select(customVO vo){
		return dao.select(vo);
	}
	@Override
	public List<customVO> searchPost(String addr1){
		return dao.listPost(addr1);
	}
	@Override
	public List<customVO> searchCountry(String country){
		return dao.listCountry(country);
	}
	@Override
	public String test() {
		return dao2.pageCount();
	}
	
	@Override
	public customVO searchOne_c(customVO vo){
		return dao.searchOne_c(vo);
	}
	
	@Override
	public List<accountVO> searchOne_a(String busi_num){
		return dao.searchOne_a(busi_num);
	}
	
	@Override
	public void insert(customVO vo){
		dao.insert(vo);
	}
	
	@Override
	public void update(customVO vo){
		dao.update(vo);
	}
	
	@Override
	public String delete(String busi_num){
		return dao.remove(busi_num);
	}
	@Override	
	public String isExisted(String busi_num){
		return dao.isExisted(busi_num);
	}
	
	@Override
	public String accountisExisted(String account_num){
		return dao.accountisExisted(account_num);
	}
	
	@Override
	public void insert_account(accountVO vo){
		dao.insert_account(vo);
	}
	@Override
	public String delete_account_alone(String account_num){
		return dao.delete_account_alone(account_num);
	}
	@Override
	public String update_account(accountVO vo){
		return dao.update_account(vo);
	}
	
}
