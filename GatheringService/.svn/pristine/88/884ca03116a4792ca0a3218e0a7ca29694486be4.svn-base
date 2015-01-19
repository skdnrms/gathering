package kr.kosta.gathering.alarm.mapper;

import java.util.List;

import kr.kosta.gathering.alarm.domain.IdentifiedNotice;


public interface AlarmMapper {
	/**
	 * 확인된 공지사항 추가하기
	 * @param notice
	 * @return
	 */
	public Integer insertIdentifiedNotice(IdentifiedNotice notice);
	
	/**
	 * 확인된 공지사항 삭제하기
	 * @param nid
	 * @return
	 */
	public Integer deleteIdentifiedNotice(int nid);
	
	/**
	 * 확인된 공지사항 읽어오기
	 * @param email
	 * @return
	 */
	public List<IdentifiedNotice> selectAllIdentifiedNotice(String email);
	
	/**
	 * 특정 소모임의 확인된 공지사항 읽어오기
	 * @param email
	 * @param gid
	 * @return
	 */
	public List<IdentifiedNotice> selectSpecifiedNotice(IdentifiedNotice notice);
}
