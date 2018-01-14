package domain;

import java.util.Date;

public class boardVO {

	private Integer bno;
	private String title;
	private String content;
	private String  writer;

	private int viewcnt;
	private int replycnt;
	private Date regdate;
	
	
	@Override
	public String toString() {
		return "boardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+", viewcnt=" + viewcnt + ", replycnt=" + replycnt
				+ ", regdate=" + regdate + "]";
	}
	
	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public boardVO() {
		// TODO Auto-generated constructor stub
	}

}
