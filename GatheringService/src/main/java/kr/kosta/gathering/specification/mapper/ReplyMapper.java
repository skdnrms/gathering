package kr.kosta.gathering.specification.mapper;

import java.util.List;

import kr.kosta.gathering.specification.domain.Reply;

public interface ReplyMapper {

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