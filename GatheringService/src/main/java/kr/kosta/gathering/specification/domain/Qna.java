package kr.kosta.gathering.specification.domain;

import java.util.Date;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.util.ConvertUtil;

public class Qna {
	
	private int gid;
	private int qid;
	private String comment;
	private Date registDate;
	private String email;
	private Member member;
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	public String getDateFormat(){
		return ConvertUtil.DSconverting(getRegistDate(), "yyyy-MM-dd");
	}
	
	@Override
	public String toString() {
		return "Qna [gid=" + gid + ", qid=" + qid + ", comment=" + comment
				+ ", registDate=" + registDate + ", email=" + email
				+ ", member=" + member + "]";
	}
	
}
