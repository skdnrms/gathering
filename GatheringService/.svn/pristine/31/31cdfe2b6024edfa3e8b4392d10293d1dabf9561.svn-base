package kr.kosta.gathering.specification.domain;

import java.util.Date;

import kr.kosta.gathering.util.ConvertUtil;

public class Curriculum {

	private int gid;
	private int cid;
	private String title;
	private String comment;
	private Date date;
	private int chapCnt;
	private boolean inProgress;
	
	
	public Curriculum() {
		
	}
	public Curriculum(int gid, int cid, String title, String comment,
			Date date, int chapCnt, boolean inProgress) {
		this.gid = gid;
		this.cid = cid;
		this.title = title;
		this.comment = comment;
		this.date = date;
		this.chapCnt = chapCnt;
		this.inProgress = inProgress;
	}
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getChapCnt() {
		return chapCnt;
	}
	public void setChapCnt(int chapCnt) {
		this.chapCnt = chapCnt;
	}
	public boolean isInProgress() {
		return inProgress;
	}
	public void setInProgress(boolean inProgress) {
		this.inProgress = inProgress;
	}
	
	public String getFormatDate() {
		
		if(getDate() != null) {
			return ConvertUtil.DSconverting(getDate(), "yyyy-MM-dd");
		} else {
			return "";
		}
	}
	
	@Override
	public String toString() {
		return "Curriculum [gid=" + gid + ", cid=" + cid + ", title=" + title
				+ ", comment=" + comment + ", date=" + date + ", chapCnt="
				+ chapCnt + ", inProgress=" + inProgress + "]";
	}
	
}
