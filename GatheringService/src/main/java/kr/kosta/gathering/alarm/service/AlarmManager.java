package kr.kosta.gathering.alarm.service;

import java.util.List;

import kr.kosta.gathering.alarm.domain.IdentifiedNotice;


public interface AlarmManager {

	/**
	 * 공지사항 알람 확인 추가하기
	 * @param noticeAlarm
	 * @return
	 */
	public Integer insertIdentifiedNotice(IdentifiedNotice notice);
	
	/**
	 * 확인한 공지사항 삭제하기
	 * @param nid
	 * @return
	 */
	public Integer deleteIdentifiedNotice(int nid);
	
	/**
	 * 모든 확인한 공지사항 읽어오기
	 * @param email
	 * @return
	 */
	public List<IdentifiedNotice> selectAllIdentifiedNotice(String email);
	
	/**
	 * 특정 소모임의 확인한 공지사항 읽어오기
	 * @param notice
	 * @return
	 */
	public List<IdentifiedNotice> selectSpecifiedNotice(IdentifiedNotice notice);
}
