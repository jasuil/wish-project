package domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class customVO {
	String busi_num ="";
	String custom=""; 
	String abbreviation="";
	String ceo=""; 
	String charge_person=""; 
	String busi_condition="";
	String item="";
	String post_num="";
	String addr1="";
	String addr2="";
	String tel="";
	String fax ="";
	String homepage="";
	String co_yn="";
	String foreign_yn="";
	String tax_yn="";
	String country_eng="";
	String country_kor="";
	String special_relation="";
	String trade_stop="";
	String contract_period_s="";
	String contract_period_e= "";
	String regi_info_man="";
	String regi_info_date=null;
	String modi_info_man="";
	String modi_info_date=null;
	int modified =0; //변경이력이 있다면 jsp화면에서 변경날짜를 보여주려고 함

	@Override
	public String toString() {
		return "customVO [busi_num=" + busi_num + ", custom=" + custom + ", abbreviation=" + abbreviation + ", ceo="
				+ ceo + ", charge_person=" + charge_person + ", busi_condition=" + busi_condition + ", item=" + item
				+ ", post_num=" + post_num + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel=" + tel + ", fax=" + fax
				+ ", homepage=" + homepage + ", co_yn=" + co_yn + ", foreign_yn=" + foreign_yn + ", tax_yn=" + tax_yn
				+ ", country_eng=" + country_eng + ", country_kor=" + country_kor + ", special_relation="
				+ special_relation + ", trade_stop=" + trade_stop + ", contract_period_s=" + contract_period_s
				+ ", contract_period_e=" + contract_period_e + ", regi_info_man=" + regi_info_man + ", regi_info_date="
				+ regi_info_date + ", modi_info_man=" + modi_info_man + ", modi_info_date=" + modi_info_date
				+ ", modified=" + modified + "]";
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public String getBusi_num() {
		return busi_num;
	}

	public void setBusi_num(String busi_num) {
		this.busi_num = busi_num;
	}

	public String getCustom() {
		return custom;
	}

	public void setCustom(String custom) {
		this.custom = custom;
	}

	
	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getCharge_person() {
		return charge_person;
	}

	public void setCharge_person(String charge_person) {
		this.charge_person = charge_person;
	}

	public String getBusi_condition() {
		return busi_condition;
	}

	public void setBusi_condition(String busi_condition) {
		this.busi_condition = busi_condition;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getPost_num() {
		return post_num;
	}

	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getCo_yn() {
		return co_yn;
	}

	public void setCo_yn(String co_yn) {
		this.co_yn = co_yn;
	}

	public String getForeign_yn() {
		return foreign_yn;
	}

	public void setForeign_yn(String foreign_yn) {
		this.foreign_yn = foreign_yn;
	}

	public String getTax_yn() {
		return tax_yn;
	}

	public void setTax_yn(String tax_yn) {
		this.tax_yn = tax_yn;
	}

	public String getCountry_eng() {
		return country_eng;
	}

	public void setCountry_eng(String country_eng) {
		this.country_eng = country_eng;
	}

	public String getCountry_kor() {
		return country_kor;
	}

	public void setCountry_kor(String country_kor) {
		this.country_kor = country_kor;
	}

	public String getSpecial_relation() {
		return special_relation;
	}

	public void setSpecial_relation(String special_relation) {
		this.special_relation = special_relation;
	}

	public String getTrade_stop() {
		return trade_stop;
	}

	public void setTrade_stop(String trade_stop) {
		this.trade_stop = trade_stop;
	}

	public String getContract_period_s() {
		return contract_period_s;
	}

	public void setContract_period_s(String contract_period_s) {
		this.contract_period_s = contract_period_s;
	}

	public String getContract_period_e() {
		return contract_period_e;
	}

	public void setContract_period_e(String contract_period_e) {
		this.contract_period_e = contract_period_e;
	}

	public String getRegi_info_man() {
		return regi_info_man;
	}

	public void setRegi_info_man(String regi_info_man) {
		this.regi_info_man = regi_info_man;
	}

	public String getRegi_info_date() {
		return regi_info_date;
	}

	public void setRegi_info_date(Date regi_info_date) {		
		Date d = regi_info_date;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.regi_info_date  = transFormat.format(d);		
	}

	public String getModi_info_man() {
		return modi_info_man;
	}

	public void setModi_info_man(String modi_info_man) {
		this.modi_info_man = modi_info_man;
	}

	public String getModi_info_date() {
		return modi_info_date;
	}

	public int getModified() {
		return modified;
	}

	public void setModified(int modified) {
		this.modified = modified;
	}

	public void setModi_info_date(Date modi_info_date) {
		if(modi_info_date != null)
			modified = 1;
		Date d = modi_info_date;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.modi_info_date =  transFormat.format(d);		
	}

	
	public customVO() {
		// TODO Auto-generated constructor stub
		 modi_info_man = "변경이력 없음";		
	}

}
