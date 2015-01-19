package kr.kosta.gathering.specification.domain;

import java.util.Date;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.util.ConvertUtil;

public class Notice {

	private int gid;
	private int nid;
	private String title;
	private String comment;
	private String email;
	private Date registDate;
	private Member member;
	private boolean isIdentified;
	
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public boolean isIdentified() {
		return isIdentified;
	}
	public void setIdentified(boolean isIdentified) {
		this.isIdentified = isIdentified;
	}
	
	public String getFormatDate() {

		if (getRegistDate() != null) {
			return ConvertUtil.DSconverting(getRegistDate(), "yy/MM/dd");
		} else {
			return "";
		}
	}
	
	@Override
	public String toString() {
		return "Notice [gid=" + gid + ", nid=" + nid + ", title=" + title
				+ ", comment=" + comment + ", email=" + email + ", registDate="
				+ registDate + ", member=" + member + "]";
	}
}
