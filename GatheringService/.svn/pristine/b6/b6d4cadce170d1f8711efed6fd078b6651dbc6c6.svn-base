package kr.kosta.gathering.reunion.domian;

import java.util.Date;
import java.util.List;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.util.ConvertUtil;
import kr.kosta.gathering.util.DateConvertUtil;
import kr.kosta.gathering.util.FieldConvertUtil;

public class Gathering {

	private int gid;
	private String name;
	private String location;
	private String field;
	private String time;
	private String date;
	private String population;
	private String introduction;
	private String photo;
	private Date startDate;
	private Date endDate;
	private List<Member> GatheringMembers;
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPopulation() {
		return population;
	}
	public void setPopulation(String population) {
		this.population = population;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public List<Member> getGatheringMembers() {
		return GatheringMembers;
	}
	public void setGatheringMembers(List<Member> gatheringMembers) {
		GatheringMembers = gatheringMembers;
	}

	
	public String getStartDateFormat() {
		if (getStartDate() != null) {
			return ConvertUtil.DSconverting(getStartDate(), "yyyy-MM-dd");
		} else {
			return "";
		}
	}

	public String getEndDateFormat() {
		if (getEndDate() != null) {
			return ConvertUtil.DSconverting(getEndDate(), "yyyy-MM-dd");
		} else {
			return "";
		}
	}
	

	public String getDateFormat() {
		if (getDate() != null && getDate().trim().length() != 0) {
			StringBuilder dateString = new StringBuilder();
			String[] dateArray = getDate().split(",");
			for (int i = 0; i < dateArray.length; i++) {
				if (i != 0) {
					dateString.append(",");
				}
				dateString.append(DateConvertUtil.DateConverter(dateArray[i]));
			}
			return dateString.toString();
		} else {
			return "";
		}
	}
	
	public String getFieldFormat() {
		String[] fieldArray = field.split(",");
		StringBuilder fieldFormat = new StringBuilder();
		for (int i = 0; i < fieldArray.length; i++) {
			if (i != 0) {
				fieldFormat.append(" / ");
			}
			fieldFormat.append(FieldConvertUtil.fieldNumberConverter(fieldArray[i]));
		}
		return fieldFormat.toString();
	}
	
	public String getGatheringMembersNum(){
		return ""+GatheringMembers.size();
	}
	
	
	@Override
	public String toString() {
		return "Gathering [gid=" + gid + ", name=" + name + ", location="
				+ location + ", field=" + field + ", time=" + time + ", date="
				+ date + ", population=" + population + ", introduction="
				+ introduction + ", photo=" + photo + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}
}
