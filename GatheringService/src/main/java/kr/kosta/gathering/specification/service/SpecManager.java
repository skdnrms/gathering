package kr.kosta.gathering.specification.service;

import java.util.List;
import java.util.Map;

import kr.kosta.gathering.specification.domain.Curriculum;
import kr.kosta.gathering.specification.domain.Notice;
import kr.kosta.gathering.specification.domain.Qna;
import kr.kosta.gathering.specification.domain.Reply;

public interface SpecManager {

	/**
	 * 커리큘럼 등록하기
	 * @param curriculums
	 * @return
	 */
	public Integer insertCurriculum(Curriculum curriculum);
	
	/**
	 * 커리큘럼 삭제하기
	 * @param gid
	 * @return
	 */
	public Integer deleteCurriculum(int gid);
	
	/**
	 * 해당 소모임의 커리큘럼 찾기
	 * @param gid
	 * @return
	 */
	public List<Curriculum> selectCurriculums(int gid);

	/**
	 * 해당 소모임들의 커리큘럼 찾기(여러건)
	 * @param gid
	 * @return
	 */
	public List<Curriculum> selectUserCurriculums(String[] gid);
	
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
	 * 선택한 기간 전후 일주일의 공지사항 읽어오기
	 * @param gid
	 * @param today
	 * @return
	 */
	public List<Notice> selectPeriodNotices(Map<String, Object> alarmINfo);
	
	/**
	 * QnA 등록하기
	 * @param qna
	 * @return
	 */
	public Integer insertQna(Qna qna);

	/**
	 * 소모임의 QnA 조회
	 * @return
	 */
	public List<Qna> selectAllQna(int gid);

	/**
	 * QnA 단권 조회
	 * @return
	 */
	public Qna selectQna(int qid);

	/**
	 * QnA 답글 등록
	 * @return
	 */
	public Integer insertReply(Reply reply);

	/**
	 * QnA 답글 단권 조회
	 * @return
	 */
	public Reply selectReply(int rid);

	/**
	 * QnA 전체 답글 조회
	 * @return
	 */
	public List<Reply> selectAllReply(int gid);

	
	/**
	 * QnA 지우기
	 * @return
	 */
	public Integer deleteQna(int qid);

	
	/**
	 * QnA 답글 지우기
	 * @return
	 */
	public Integer deleteReply(int rid);

	/**
	 * QnA 답글들 지우기
	 * @return
	 */
	public Integer deleteReplys(int qid);
}