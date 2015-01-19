package kr.kosta.gathering.specification.mapper;

import java.util.List;
import java.util.Map;

import kr.kosta.gathering.specification.domain.Notice;

public interface NoticeMapper {
	
	/**
	 * 공지사항 등록하기
	 * @param notice
	 * @return
	 */
	public Integer insertNotice(Notice notice);
	
	/**
	 * 공지사항 삭제하기
	 * @param nid
	 * @return
	 */
	public Integer deleteNotice(int nid);
	
	/**
	 * 공지사항 수정하기
	 * @param notice
	 * @return
	 */
	public Integer updateNotice(Notice notice);
	
	/**
	 * 공지사항 읽어오기
	 * @param nid
	 * @return
	 */
	public Notice selectNotice(int nid);
	
	/**
	 * 해당 소모임의 모든 공지사항 읽어오기
	 * @param gid
	 * @return
	 */
	public List<Notice> selectAllNotice(int gid);
	
	/**
	 * 오늘날짜 이전의 일주일 공지사항 읽어오기
	 * @param gid
	 * @return
	 */
	public List<Notice> selectPeriodNotices(Map<String, Object> alarmINfo);

}
