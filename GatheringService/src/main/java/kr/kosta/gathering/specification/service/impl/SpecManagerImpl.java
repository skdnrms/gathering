package kr.kosta.gathering.specification.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.kosta.gathering.specification.domain.Curriculum;
import kr.kosta.gathering.specification.domain.Notice;
import kr.kosta.gathering.specification.domain.Qna;
import kr.kosta.gathering.specification.domain.Reply;
import kr.kosta.gathering.specification.mapper.CurriculumMapper;
import kr.kosta.gathering.specification.mapper.NoticeMapper;
import kr.kosta.gathering.specification.mapper.QnaMapper;
import kr.kosta.gathering.specification.mapper.ReplyMapper;
import kr.kosta.gathering.specification.service.SpecManager;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpecManagerImpl implements SpecManager {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * Reply mapper
	 * @return
	 */
	private ReplyMapper getReplyMapper() {
		
		return sqlSession.getMapper(ReplyMapper.class);
	}
	/**
	 * QnA mapper
	 * @return
	 */
	private QnaMapper getQnaMapper() {
		
		return sqlSession.getMapper(QnaMapper.class);
	}
	/**
	 * 커리큘럼 mapper
	 * @return
	 */
	private CurriculumMapper getCurriMapper() {
		
		return sqlSession.getMapper(CurriculumMapper.class);
	}
	
	/**
	 * 공지사항 mapper
	 * @return
	 */
	private NoticeMapper getNoticeMapper() {
		
		return sqlSession.getMapper(NoticeMapper.class);
	}
	
	/**
	 * 커리큘럼 등록하기
	 * @param curriculums
	 * @return
	 */
	@Override
	public Integer insertCurriculum(Curriculum curriculum) {
		
		return getCurriMapper().insertCurriculum(curriculum);
	}
	
	/**
	 * 커리큘럼 삭제하기
	 */
	@Override
	public Integer deleteCurriculum(int gid) {

		return getCurriMapper().deleteCurriculum(gid);
	}
	
	/**
	 * 해당 소모임의 커리큘럼 찾기
	 * @param gid
	 * @return
	 */
	@Override
	public List<Curriculum> selectCurriculums(int gid) {
		
		List<Curriculum> list = new ArrayList<Curriculum>();
		list = getCurriMapper().selectCurriculums(gid);
		
		if(list != null) {
			
			return list;
		}
		
		return null;
	}
	
	/**
	 * 해당 소모임들의 커리큘럼 찾기(여러건)
	 * @param gid
	 * @return
	 */
	@Override
	public List<Curriculum> selectUserCurriculums(String[] gid) {
		return getCurriMapper().selectUserCurriculums(gid);
	}
	
	/**
	 * QnA 등록하기
	 */
	@Override
	public Integer insertQna(Qna qna) {
		
		return getQnaMapper().insertQna(qna);
	}
	
	/**
	 * 공지사항 등록하기
	 */
	@Override
	public Integer insertNotice(Notice notice) {
		
		return getNoticeMapper().insertNotice(notice);
	}
	/**
	 * 공지사항 삭제하기
	 */
	@Override
	public Integer deleteNotice(int nid) {

		return getNoticeMapper().deleteNotice(nid);
	}
	/**
	 * 공지사항 수정하기
	 */
	@Override
	public Integer updateNotice(Notice notice) {

		return getNoticeMapper().updateNotice(notice);
	}
	
	/**
	 * 공지사항 읽어오기 
	 */
	@Override
	public Notice selectNotice(int nid) {

		return getNoticeMapper().selectNotice(nid);
	}
	
	/**
	 * 해당 소모임의 모든 공지사항 읽어오기 
	 */
	@Override
	public List<Notice> selectAllNotice(int gid) {

		List<Notice> notices = new ArrayList<Notice>();
		
		notices = getNoticeMapper().selectAllNotice(gid);
		
		if(notices != null) {
			return notices;
		}
		
		return null;
	}
	
	/**
	 * 오늘 전후 일주일의 공지사항 읽어오기
	 */
	@Override
	public List<Notice> selectPeriodNotices(Map<String, Object> alarmINfo) {

		List<Notice> noticeList = new ArrayList<Notice>();
		
		if(alarmINfo != null) {
			
			noticeList = getNoticeMapper().selectPeriodNotices(alarmINfo);
			
			return noticeList;
		}
		
		return null;
	}
	
	/**
	 * 소모임의 QnA 조회
	 * @return
	 */
	@Override
	public List<Qna> selectAllQna(int gid) {
		return getQnaMapper().selectAllQna(gid);
	}
	
	/**
	 * QnA 단권 조회
	 * @return
	 */
	@Override
	public Qna selectQna(int qid) {
		return getQnaMapper().selectQna(qid);
	}
	
	/**
	 * QnA 답글 등록
	 * @return
	 */
	@Override
	public Integer insertReply(Reply reply) {
		return getReplyMapper().insertReply(reply);
	}
	
	/**
	 * QnA 답글 단권 조회
	 * @return
	 */
	@Override
	public Reply selectReply(int rid) {
		return getReplyMapper().selectReply(rid);
	}
	
	/**
	 * QnA 전체 답글 조회
	 * @return
	 */
	@Override
	public List<Reply> selectAllReply(int gid) {
		return getReplyMapper().selectAllReply(gid);
	}
	
	/**
	 * QnA 지우기
	 * @return
	 */
	@Override
	public Integer deleteQna(int qid) {
		return getQnaMapper().deleteQna(qid);
	}
	
	/**
	 * QnA 답글 지우기
	 * @return
	 */
	@Override
	public Integer deleteReply(int rid) {
		return getReplyMapper().deleteReply(rid);
	}
	
	/**
	 * QnA 답글들 지우기
	 * @return
	 */
	@Override
	public Integer deleteReplys(int qid) {
		return getReplyMapper().deleteReplys(qid);
	}
	
}
