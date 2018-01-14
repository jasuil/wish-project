package domain;

public class accountVO {

	String busi_num;
	String factory;
	String trade_bank; 
	String account_num;
	
	
	@Override
	public String toString() {
		return "accountVO [busi_num=" + busi_num + ", factory=" + factory + ", trade_bank=" + trade_bank
				+ ", account_num=" + account_num + "]";
	}

	public String getBusi_num() {
		return busi_num;
	}

	public void setBusi_num(String busi_num) {
		this.busi_num = busi_num;
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

	public accountVO() {
		// TODO Auto-generated constructor stub
	}

}
