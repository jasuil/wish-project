package a.b.c;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import domain.customVO;
import persistence.customDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {

	@Inject
	static customDAO dao;
	
	@Test
	public void testConection()throws Exception{
		customVO vo = new customVO();
		vo.setBusi_num("1");
		System.out.println(dao.searchOne_a(vo.getBusi_num()));
	}
	
	public static void main(String args[]){
		
		customVO vo= new customVO();
		vo.setBusi_num("11111");
		vo = dao.select(vo);
		
		Date d = new Date();
	//	d =vo.getRegi_info_date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(d);
		System.out.println(to);
		System.out.println(d);
		
		
	}
}


