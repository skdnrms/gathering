package kr.kosta.gathering.reunion.mapper;

import java.util.List;
import java.util.Map;

import kr.kosta.gathering.reunion.domian.RegistGathering;

public interface RegistGatheringMapper {

	/**
	 * 모인관계 추가
	 * @param registGathering
	 * @return
	 */
	public Integer insertRegistGathering(RegistGathering registGathering);
	
	/**
	 * 모임 탈퇴하기
	 * @param registGathering
	 * @return
	 */
	public Integer deleteRegistGathering(RegistGathering registGathering);
	
	/**
	 * 회원의 이메일과 모임시퀀스를 이용한 회원 등급 검색
	 * @param email
	 * @param gid
	 * @return
	 */
	public RegistGathering selectRegistGathering(Map<String, Object> gatheringInfo);

	/**
	 * 회원의 이메일을 이용한 회원 가입모임 리스트
	 * @param email
	 * @return
	 */
	public List<RegistGathering> selectRegistGatheringList(String email);
}
