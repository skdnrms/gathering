package kr.kosta.gathering.member.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.member.mapper.MemberMapper;
import kr.kosta.gathering.member.service.MemberManager;

@Service
@Transactional
public class MemberManagerImpl implements MemberManager {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private MemberMapper getMemberMapper() {
		
		return sqlSession.getMapper(MemberMapper.class);
	}
	
	/**
	 * 이메일 조회로 사용자 찾기
	 */
	@Override
	public Member selectMember(String email) {
		
		Member user = getMemberMapper().selectMember(email);
		
		if(user != null) {
			return user;
		}
		
		return null;
	}
	
	/**
	 * 이메일과 기간을 이용하여 조건에 맞는 사용자들 찾기
	 * @param userInfo
	 * @return
	 */
	@Override
	public List<Member> selectMembers(Map<String, Object> userInfo) {
		
		List<Member> members = new ArrayList<Member>();
		
		members = getMemberMapper().selectMembers(userInfo);
		
		return members;
	}
	
	/**
	 * 회원 등록하기
	 */
	@Override
	public Integer insertMember(Member member) {
		
		if(member != null) {
			return getMemberMapper().insertMember(member);
		}
		
		return null;
	}
	
	/**
	 * 회원 정보 수정하기
	 */
	@Override
	public Integer updateMember(Member member) {
		
		if(member != null) {
			return getMemberMapper().updateMember(member);
		}
		
		return null;
	}
}
