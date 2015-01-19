package kr.kosta.gathering.reunion.service;

import java.util.List;
import java.util.Map;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.reunion.domian.Gathering;
import kr.kosta.gathering.reunion.domian.RegistGathering;

public interface GatheringManager {
	
	/**
	 * 모임 개설
	 * @param gathering
	 * @return
	 */
	public Integer insertGathering(Gathering gathering);

	/**
	 * 모임 이름검색
	 * @param name
	 * @return
	 */
	public String selectGatheringName(String name);

	/**
	 * 모든 모임 검색
	 * @return
	 */
	public List<Gathering> selectAllGathering();
	
	/**
	 * 가입한 모든 모임 검색
	 * @param email
	 * @return
	 */
	public List<Gathering> selectAllMyGathering(String email);

	/**
	 * 모임 검색
	 * @param gid
	 * @return
	 */
	public Gathering selectGathering(Integer gid);
	
	/**
	 * 모임관계 추가
	 * @param registGathering
	 * @return
	 */
	public Integer insertRegistGathering(RegistGathering registGathering);
	
	/**
	 * 모임 탈퇴하기
	 * @param gid
	 * @param email
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

	/**
	 * 모임 검색(검색조건에 의한)
	 * @param searchGathering
	 * @return
	 */
	public List<Gathering> selectSearchGathering(Gathering searchGathering);

	/**
	 * 모임에 가입한 멤버리스트
	 * @param gid
	 * @return
	 */
	public List<Member> selectGatheringMembers(int gid);

	/**
	 * 모임정보 수정
	 * @param gid
	 * @return
	 */
	public Integer updateGathering(Gathering gathering);

	/**
	 * Master등급의 내모임목록
	 * @param email
	 * @return
	 */
	public List<Gathering> selectMasterGathering(String email);
}
