package kr.kosta.gathering.specification.mapper;

import java.util.List;

import kr.kosta.gathering.specification.domain.Curriculum;

public interface CurriculumMapper {
	
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

}