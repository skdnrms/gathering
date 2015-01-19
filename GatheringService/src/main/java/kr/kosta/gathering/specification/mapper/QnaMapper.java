package kr.kosta.gathering.specification.mapper;

import java.util.List;

import kr.kosta.gathering.specification.domain.Qna;

public interface QnaMapper {

	/**
	 * Qna 등록하기
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
	 * QnA 지우기
	 * @return
	 */
	public Integer deleteQna(int qid);
}
