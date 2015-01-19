package kr.kosta.gathering.member.mapper;

import java.util.List;
import java.util.Map;

import kr.kosta.gathering.member.domain.Member;

public interface MemberMapper {

	/**
	 * 이메일 조회로 사용자 찾기
	 * @param email
	 * @return
	 */
	public Member selectMember(String email);
	
	/**
	 * 이메일과 기간을 이용하여 조건에 맞는 사용자들 찾기
	 * @param userInfo
	 * @return
	 */
	public List<Member> selectMembers(Map<String, Object> userInfo);
	
	/**
	 * 멤버 등록하기
	 * @param member
	 * @return
	 */
	public Integer insertMember(Member member);
	
	/**
	 * 멤버 정보 수정하기
	 * @param member
	 * @return
	 */
	public Integer updateMember(Member member);
}
