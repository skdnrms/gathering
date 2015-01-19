package kr.kosta.gathering.reunion.mapper;

import java.util.List;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.reunion.domian.Gathering;

public interface GatheringMapper {

	/**
	 * 모임 개설
	 * @param gathering
	 * @return
	 */
	public Integer inertGathering(Gathering gathering);

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
