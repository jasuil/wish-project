package service;

import java.util.List;

import domain.accountVO;
import domain.customVO;

public interface customService {

	public List<customVO> leftList(customVO vo);
	public customVO select(customVO vo);
	public List<customVO> searchPost(String addr1);
	public List<customVO> searchCountry(String country);
	public customVO searchOne_c(customVO vo);
	public List<accountVO> searchOne_a(String busi_num);
	public void insert(customVO vo);
	public void update(customVO vo);
	public String delete(String busi_num);
	public String test();
	public String isExisted(String busi_num);	
	
	public String accountisExisted(String account_num);
	public void insert_account(accountVO vo);
	public String delete_account_alone(String account_num);
	public String update_account(accountVO vo);
}
