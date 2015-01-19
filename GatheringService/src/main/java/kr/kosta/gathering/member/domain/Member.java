package kr.kosta.gathering.member.domain;

import java.util.Date;
import java.util.List;



import kr.kosta.gathering.reunion.domian.RegistGathering;
import kr.kosta.gathering.util.ConvertUtil;

public class Member{
	
	private String email;
	private String password;
	private String name;
	private String phone;
	private Date birthday;
	private String gender;
	private String location;
	private String photo;
	private List<RegistGathering> registGatherings;
	private Date registday;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public List<RegistGathering> getRegistGatherings() {
		return registGatherings;
	}
	public void setRegistGatherings(List<RegistGathering> registGatherings) {
		this.registGatherings = registGatherings;
	}
	public Date getRegistday() {
		return registday;
	}
	
	public String getFormatDate() {

		if (getBirthday() != null) {
			return ConvertUtil.DSconverting(getBirthday(), "yyyy-MM-dd");
		} else {
			return "";
		}
	}
	
	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", name="
				+ name + ", phone=" + phone + ", birthday=" + birthday
				+ ", gender=" + gender + ", location=" + location + ", photo="
				+ photo + ", registGatherings=" + registGatherings
				+ ", registday=" + registday + "]";
	}
	
}
