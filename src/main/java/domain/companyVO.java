package domain;

public class companyVO extends customVO {


	private String factory;
	private String trade_bank; 
	private String account_num;

	@Override
	public String toString() {
		return "companyVO [factory=" + factory + ", trade_bank=" + trade_bank + ", account_num=" + account_num
				+ ", busi_num=" + busi_num + ", custom=" + custom + ", abbreviation=" + abbreviation + ", ceo=" + ceo
				+ ", charge_person=" + charge_person + ", busi_condition=" + busi_condition + ", item=" + item
				+ ", post_num=" + post_num + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel=" + tel + ", fax=" + fax
				+ ", homepage=" + homepage + ", co_yn=" + co_yn + ", foreign_yn=" + foreign_yn + ", tax_yn=" + tax_yn
				+ ", country_eng=" + country_eng + ", country_kor=" + country_kor + ", special_relation="
				+ special_relation + ", trade_stop=" + trade_stop + ", contract_period_s=" + contract_period_s
				+ ", contract_period_e=" + contract_period_e + ", regi_info_man=" + regi_info_man + ", regi_info_date="
				+ regi_info_date + ", modi_info_man=" + modi_info_man + ", modi_info_date=" + modi_info_date
				+ ", modified=" + modified + "]";
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	

	public String getTrade_bank() {
		return trade_bank;
	}

	public void setTrade_bank(String trade_bank) {
		this.trade_bank = trade_bank;
	}

	public String getAccount_num() {
		return account_num;
	}

	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	public companyVO() {
		// TODO Auto-generated constructor stub
	}

}
