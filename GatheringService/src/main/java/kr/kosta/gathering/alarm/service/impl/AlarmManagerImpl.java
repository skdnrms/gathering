package kr.kosta.gathering.alarm.service.impl;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosta.gathering.alarm.domain.IdentifiedNotice;
import kr.kosta.gathering.alarm.mapper.AlarmMapper;
import kr.kosta.gathering.alarm.service.AlarmManager;

@Service
public class AlarmManagerImpl implements AlarmManager {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private AlarmMapper getAlarmMapper() {
		
		return sqlSession.getMapper(AlarmMapper.class);
	}
	
	/**
	 * 확인된 공지사항 추가하기
	 */
	@Override
	public Integer insertIdentifiedNotice(IdentifiedNotice notice) {
		
		return getAlarmMapper().insertIdentifiedNotice(notice);
	}
	
	/**
	 * 확인된 공지사항 삭제하기
	 */
	@Override
	public Integer deleteIdentifiedNotice(int nid) {

		return getAlarmMapper().deleteIdentifiedNotice(nid);
	}
	/**
	 * 모든 확인한 공지사항 읽어오기
	 */
	@Override
	public List<IdentifiedNotice> selectAllIdentifiedNotice(String email) {
		
		List<IdentifiedNotice> noticeAlarmList = null;
		noticeAlarmList = getAlarmMapper().selectAllIdentifiedNotice(email);
		
		return noticeAlarmList;
	}

	/**
	 * 특정 소모임의 확인한 공지사항 읽어오기
	 */
	@Override
	public List<IdentifiedNotice> selectSpecifiedNotice(IdentifiedNotice notice) {

		List<IdentifiedNotice> noticeList = null;
		noticeList = getAlarmMapper().selectSpecifiedNotice(notice);
		
		return noticeList;
	}

}
