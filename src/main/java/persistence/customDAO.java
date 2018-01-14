package persistence;

import java.util.List;

import domain.accountVO;
import domain.customVO;


public interface customDAO {
	public void insert(customVO vo);
	public customVO read(int bno);
	public void update(customVO vo);
	public String remove(String busi_num);
	public void modify();
	public customVO select(customVO vo);
	public List<customVO> listLeft(customVO vo);
	public List<customVO> listPost(String addr1);
	public List<customVO> listCountry(String country);
	public customVO searchOne_c(customVO vo);
	public List<accountVO> searchOne_a(String busi_num);
	public String isExisted(String busi_num);
	
	public String accountisExisted(String account_num);
	public void insert_account(accountVO vo);
	public String delete_account_alone(String account_num);
	public String update_account(accountVO vo);
}
