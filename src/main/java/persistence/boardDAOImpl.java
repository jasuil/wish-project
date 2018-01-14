package persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class boardDAOImpl implements boardDAO{

	
	@Inject
	SqlSession session;
	private static String namespace = "custom";
	

	public String pageCount(){

	return session.selectOne(namespace+".te");	
	}
	
	public Integer pageCount2(){
		
	 System.out.println(session.selectOne("custom.t"));	
	 return 1;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boardDAOImpl d= new boardDAOImpl();
		d.pageCount2();
	}

}
