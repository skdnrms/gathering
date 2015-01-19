package kr.kosta.gathering.alarm.domain;


public class IdentifiedQna {

	private String email;
	private int qid;
	private int gid;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	@Override
	public String toString() {
		return "QnaAlarm [email=" + email + ", qid=" + qid + ", gid=" + gid
				+ "]";
	}
	
	
}
