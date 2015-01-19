package kr.kosta.gathering.reunion;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.kosta.gathering.alarm.domain.IdentifiedNotice;
import kr.kosta.gathering.alarm.service.AlarmManager;
import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.member.domain.PhotoFile;
import kr.kosta.gathering.member.domain.UserInfo;
import kr.kosta.gathering.reunion.domian.Gathering;
import kr.kosta.gathering.reunion.domian.RegistGathering;
import kr.kosta.gathering.reunion.service.GatheringManager;
import kr.kosta.gathering.specification.domain.CurriculumForm;
import kr.kosta.gathering.specification.domain.Curriculum;
import kr.kosta.gathering.specification.domain.Notice;
import kr.kosta.gathering.specification.domain.Qna;
import kr.kosta.gathering.specification.domain.Reply;
import kr.kosta.gathering.specification.service.SpecManager;
import kr.kosta.gathering.util.ConvertUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/gathering")
public class GatheringController {
	
	@Autowired
	private GatheringManager gatheringManager;
	
	@Autowired
	private SpecManager specManager;
	
	@Autowired
	private AlarmManager alarmManager;
	
	@RequestMapping("")
	public String gathering(Model model){
		
		List<Gathering> allGathering = gatheringManager.selectAllGathering();
		model.addAttribute("gatheringList", allGathering);
		
		return "client/grouplist";
	}
	
	@RequestMapping("/opengathering")
	public String openGathering() {
		
		return "reunion/opengathering";
	}
	
	@RequestMapping("/my")
	public String mygrouplist(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		// 내가 가입한 모든 모임
		List<Gathering> myAllGat = gatheringManager.selectAllMyGathering(loginUser.getEmail());
		// 등급이 Master인 모임
		List<Gathering> myMasterGat = gatheringManager.selectMasterGathering(loginUser.getEmail());	
		// Map<gid, true> Master 등급 확인용
		Map<Integer, Boolean> MasterGradeTest = new HashMap<Integer, Boolean>();
		for (Gathering gathering : myMasterGat) {
			MasterGradeTest.put(gathering.getGid(), true);
		}
		
		model.addAttribute("MasterGradeTest", MasterGradeTest);
		model.addAttribute("myAllGat", myAllGat);
		model.addAttribute("myMasterGat", myMasterGat);
		
		return "client/mygrouplist";
	}
	
	@RequestMapping(value = "/open.do", method = RequestMethod.POST)
	public String openGathering(HttpSession session, @ModelAttribute Gathering gathering
			, @RequestParam(value="startDate_chanage", required=false) String startDate
			, @RequestParam(value="endDate_chanage", required=false) String endDate) {
		
		Member member = (Member) session.getAttribute(UserInfo.LOGIN_INFO);
		
		if (!startDate.isEmpty()) {
			gathering.setStartDate(ConvertUtil.SDconverting(startDate));
		}
		
		if (!endDate.isEmpty()) {
			gathering.setEndDate(ConvertUtil.SDconverting(endDate));
		}
		
		gathering.setPhoto("group-defult.jpg");
		gatheringManager.insertGathering(gathering);
		int gid = gathering.getGid();
		
		RegistGathering registGathering = new RegistGathering();
		registGathering.setEmail(member.getEmail());
		registGathering.setGid(gid);
		registGathering.setGrade(UserInfo.GRADE_TYPE_MASTER);
		
		gatheringManager.insertRegistGathering(registGathering);
		
		return "redirect:group?gid=" + gid;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updateGathering(HttpServletRequest request, HttpSession session, @ModelAttribute Gathering gathering
			, @RequestParam(value="startDate_chanage", required=false) String startDate
			, @RequestParam(value="endDate_chanage", required=false) String endDate
			, @ModelAttribute("photoFile")PhotoFile photofile) {
		
		Member member = (Member) session.getAttribute(UserInfo.LOGIN_INFO);
		
		if (!startDate.isEmpty()) {
			gathering.setStartDate(ConvertUtil.SDconverting(startDate));
		}
		
		if (!endDate.isEmpty()) {
			gathering.setEndDate(ConvertUtil.SDconverting(endDate));
		}
		
		if(photofile.getPhotoFile().getSize() != 0) {
			String photoName = ConvertUtil.savePhoto(photofile.getPhotoFile(), 
					getSavePhotoPath(request, ConvertUtil.GATHERING_PHOTOPATH, member.getEmail()));
			
			gathering.setPhoto(photoName);
		}
		
		System.out.println(gathering);
		
		gatheringManager.updateGathering(gathering);
		
		return "redirect:group?gid="+gathering.getGid();
	}
	
	@ResponseBody
	@RequestMapping("/open.ajax")
	public Map<String, String> openGatheringAjax(@RequestParam String name){
		
		Map<String, String> result = new HashMap<String, String>();
		String gatheringName = gatheringManager.selectGatheringName(name);
		
		if (gatheringName != null && gatheringName.trim().length() != 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
	/**
	 * 소모임 메인페이지
	 * @param model
	 * @param gid
	 * @return
	 */
	@RequestMapping("/group")
	public String group(HttpSession session, Model model, @RequestParam("gid") int gid) {
		
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		
		// 모임 정보
		Gathering gathering = gatheringManager.selectGathering(gid);
		
		// 모임에 가입된 회원 리스트
		List<Member> gatheringMembers = gatheringManager.selectGatheringMembers(gid);
		gathering.setGatheringMembers(gatheringMembers);
		
		// 모임에 가입유무 정보
		Map<String, Object> gatheringInfo = new HashMap<String, Object>();
		gatheringInfo.put("gid", gid);
		gatheringInfo.put("email", loginUser.getEmail());
		
		RegistGathering regisGat = gatheringManager.selectRegistGathering(gatheringInfo);
		
		String grade = null;
		if(regisGat != null) {
			grade = regisGat.getGrade();
		}
		
		// 해당 모임의 커리큘럼
		Date today = new Date();
		List<Curriculum> curriculums = specManager.selectCurriculums(gid);
		
		// 진행상황을 표시하기 위한 로직
		if (!curriculums.isEmpty()) {
		
			long diffOfDate[] = new long[curriculums.size()];
			int i = 0;
			
			for (Curriculum curriculum : curriculums) {
				
				if (curriculum.getDate() != null) {
					diffOfDate[i] = today.getTime() - curriculum.getDate().getTime();
				} else {
					diffOfDate[i] = -1;
				}
				i++;
			}
			int isProgressed = progressedCurri(diffOfDate);
			curriculums.get(isProgressed).setInProgress(true);
		}

		// 해당 소모임의 공지사항 읽어오기
		List<Notice> notices = specManager.selectAllNotice(gid);
		
		/* 로그인 유저의 확인한 공지사항 읽어오기 */
		IdentifiedNotice identifiedNoticeInfo = new IdentifiedNotice();
		identifiedNoticeInfo.setGid(gid);
		identifiedNoticeInfo.setEmail(loginUser.getEmail());
		
		List<IdentifiedNotice> identifiedNotices = alarmManager.selectSpecifiedNotice(identifiedNoticeInfo);
		
		if(!(UserInfo.GRADE_TYPE_MASTER.equals(grade))) {
			model.addAttribute("noticeCnt", notices.size() - identifiedNotices.size());
		}
		
		if(curriculums.size() > 0) {
			model.addAttribute("curriculums", curriculums);
		}
		
		model.addAttribute("grade", grade);
		model.addAttribute("gathering", gathering);
		
		return "reunion/information/information";
	}
	
	/**
	 * 공지사항 페이지 이동
	 * @param model
	 * @param gid
	 * @return
	 */
	@RequestMapping("/notice")
	public String moveNotice(HttpSession session, Model model, @RequestParam("gid") int gid){
		
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		
		// 모임 정보
		Map<String, Object> gatheringInfo = new HashMap<String, Object>();
		gatheringInfo.put("gid", gid);
		gatheringInfo.put("email", loginUser.getEmail());
		
		Gathering gathering = gatheringManager.selectGathering(gid);
		// 모임에 가입한 정보
		RegistGathering registGat = gatheringManager.selectRegistGathering(gatheringInfo);
		// 해당 모임의 공지사항 목록
		List<Notice> notices = specManager.selectAllNotice(gid);
		
		/* 로그인 유저의 확인한 공지사항 읽어오기 */
		IdentifiedNotice identifiedNoticeInfo = new IdentifiedNotice();
		identifiedNoticeInfo.setGid(gid);
		identifiedNoticeInfo.setEmail(loginUser.getEmail());

		List<IdentifiedNotice> identifiedNotices = alarmManager.selectSpecifiedNotice(identifiedNoticeInfo);

		// '확인한 공지사항'과 '등록된 공지사항'이 같은 경우 표시
		if (notices.size() > 0 && identifiedNotices.size() > 0) {
			for (IdentifiedNotice identifiedNotice : identifiedNotices) {
				for (Notice notice : notices) {
					if (notice.getGid() == identifiedNotice.getGid() && notice.getNid() == identifiedNotice.getNid()) {
						notice.setIdentified(true);
						break;
					}
				}
			}
		}

		String grade = null;
		if (registGat != null) {
			grade = registGat.getGrade();
		}
		
		model.addAttribute("grade", grade);
		model.addAttribute("notices", notices);
		model.addAttribute("gathering", gathering);
		
		return "reunion/notice";
	}
	
	/**
	 * 공지사항 추가
	 * @param title
	 * @param comment
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="notice/addNotice.ajax", method=RequestMethod.POST)
	public Notice addNotice(HttpSession session, @RequestParam("gid")int gid
			, @RequestParam("title")String title, @RequestParam("comment")String comment) {

		Member loginUser = (Member) session.getAttribute(UserInfo.LOGIN_INFO);

		Notice newNotice = new Notice();

		newNotice.setGid(gid);
		newNotice.setEmail(loginUser.getEmail());
		newNotice.setTitle(title);
		newNotice.setComment(comment);

		int isSave = specManager.insertNotice(newNotice);

		int newNid = 0;
		if (isSave != -1) {

			newNid = newNotice.getNid();
			Notice savedNotice = specManager.selectNotice(newNid);

			return savedNotice;
		}

		return null;
	}
	/**
	 * 공지사항 수정하기
	 * @param notice
	 * @return
	 */
	@RequestMapping(value="notice/updateNotice.do", method=RequestMethod.POST)
	public String updateNotice(@ModelAttribute Notice notice) {
		
		int nid = notice.getNid();
		int gid = notice.getGid();
		System.out.println(">>>" + notice);
		
		specManager.updateNotice(notice);
		alarmManager.deleteIdentifiedNotice(nid);
		
		return "redirect:/gathering/notice?gid=" + gid;
	}
	
	/**
	 * 공지사항 삭제
	 * @param type
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="removeNotice.ajax")
	public Integer removeNotice(@RequestParam String type, @RequestParam int id) {
		
		// int removeId = Integer.parseInt(id);
		
		// 공지사항의 글 삭제
		if ("nid".equals(type)) {

			alarmManager.deleteIdentifiedNotice(id);
			
			return specManager.deleteNotice(id);
		}
		
		return 0;
	}
	/**
	 * 모임에 가입한 회원 불러오기
	 * @param model
	 * @param gid
	 * @return
	 */
	@RequestMapping("/members")
	public String members(HttpSession session, Model model, @RequestParam("gid") int gid) {
		
		// 모임 정보
		Gathering gathering = gatheringManager.selectGathering(gid);
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		
		// 모임에 가입된 회원 리스트
		List<Member> gatheringMembers = gatheringManager.selectGatheringMembers(gid);
		gathering.setGatheringMembers(gatheringMembers);
		
		// 모임에 가입유무 정보
		Map<String, Object> gatheringInfo = new HashMap<String, Object>();
		gatheringInfo.put("gid", gid);
		gatheringInfo.put("email", loginUser.getEmail());
		
		RegistGathering regisGat = gatheringManager.selectRegistGathering(gatheringInfo);
		
		String grade = null;
		if(regisGat != null) {
			grade = regisGat.getGrade();
		}
		// 해당 소모임의 공지사항 읽어오기
		List<Notice> notices = specManager.selectAllNotice(gid);
		
		/* 로그인 유저의 확인한 공지사항 읽어오기 */
		IdentifiedNotice identifiedNoticeInfo = new IdentifiedNotice();
		identifiedNoticeInfo.setGid(gid);
		identifiedNoticeInfo.setEmail(loginUser.getEmail());
		
		List<IdentifiedNotice> identifiedNotices = alarmManager.selectSpecifiedNotice(identifiedNoticeInfo);
		
		if(!(UserInfo.GRADE_TYPE_MASTER.equals(grade))) {
			model.addAttribute("noticeCnt", notices.size() - identifiedNotices.size());
		}
		
		model.addAttribute("gathering", gathering);
		
		return "reunion/memberlist";
	}
	/**
	 * 질문하기
	 * @return
	 */
	@RequestMapping("/qna")
	public String qna(HttpSession session, Model model, @RequestParam("gid") int gid) {

		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		// 모임 정보
		Gathering gathering = gatheringManager.selectGathering(gid);
		model.addAttribute("gathering", gathering);
		
		// QnA 정보
		List<Qna> qnaList = specManager.selectAllQna(gid);
		model.addAttribute("QnaList", qnaList);
		
		// Reply 정보
		List<Reply> replyList = specManager.selectAllReply(gid);
	
		// Map<qid, 댓글리스트> 형식으로 저장
		Map<Integer, List<Reply>> resultReply = new HashMap<Integer, List<Reply>>();
		
		// Map<qid, 댓글개수> 형식으로 저장
		Map<Integer, Integer> replyLength = new HashMap<Integer, Integer>();
		
		for (Qna qna : qnaList) {
			List<Reply> replys = new ArrayList<Reply>();
			for (Reply reply : replyList) {
				if(qna.getQid() == reply.getQid()){
					replys.add(reply);
				}
			}
			resultReply.put(qna.getQid(), replys);
			replyLength.put(qna.getQid(), replys.size());
		}
		model.addAttribute("resultReply", resultReply);
		model.addAttribute("replyLength", replyLength);
		
		// 모임에 가입된 회원 리스트
		List<Member> gatheringMembers = gatheringManager.selectGatheringMembers(gid);
		gathering.setGatheringMembers(gatheringMembers);
		
		// 모임에 가입유무 정보
		Map<String, Object> gatheringInfo = new HashMap<String, Object>();
		gatheringInfo.put("gid", gid);
		gatheringInfo.put("email", loginUser.getEmail());
		
		RegistGathering regisGat = gatheringManager.selectRegistGathering(gatheringInfo);
		
		String grade = null;
		if(regisGat != null) {
			grade = regisGat.getGrade();
		}
		// 해당 소모임의 공지사항 읽어오기
		List<Notice> notices = specManager.selectAllNotice(gid);
		
		/* 로그인 유저의 확인한 공지사항 읽어오기 */
		IdentifiedNotice identifiedNoticeInfo = new IdentifiedNotice();
		identifiedNoticeInfo.setGid(gid);
		identifiedNoticeInfo.setEmail(loginUser.getEmail());
		
		List<IdentifiedNotice> identifiedNotices = alarmManager.selectSpecifiedNotice(identifiedNoticeInfo);
		
		if(!(UserInfo.GRADE_TYPE_MASTER.equals(grade))) {
			model.addAttribute("noticeCnt", notices.size() - identifiedNotices.size());
		}
		
		return "reunion/qna";
	}
	/**
	 * 소모임 가입하기
	 * @return
	 */
	@RequestMapping("/joinGat")
	public String joinGat(HttpSession session, Model model, @RequestParam("gid") int gid) {
		
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		System.out.println("가입하기");
		RegistGathering joinMember = new RegistGathering();
		
		joinMember.setEmail(loginUser.getEmail());
		joinMember.setGid(gid);
		joinMember.setGrade(UserInfo.GRADE_TYPE_JUNIOR);
		
		gatheringManager.insertRegistGathering(joinMember);
		
		return "redirect:/gathering/group?gid=" + gid;
	}
	/**
	 * 소모임 탈퇴하기
	 * @param session
	 * @param gid
	 * @return
	 */
	@RequestMapping("/dropGat")
	public String dropGat(HttpSession session, @RequestParam("gid") int gid) {
		
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		RegistGathering registGat = new RegistGathering();
		
		registGat.setEmail(loginUser.getEmail());
		registGat.setGid(gid);
		
		gatheringManager.deleteRegistGathering(registGat);
		
		return "redirect:my";
	}
	/**
	 * 커리큘럼 등록하기
	 * @param curriculum
	 * @param schedule
	 * @param gid
	 * @return
	 */
	@RequestMapping(value="/registCurri.do", method=RequestMethod.POST)
	public String addCurriculum(@ModelAttribute CurriculumForm curriculumForm
			, @RequestParam("schedule") String[] schedules
			, @RequestParam("gid") int gid) {

		List<Curriculum> curriculums = curriculumForm.getCurriculums();
		
		if (curriculums != null) {
			// 새로운 커리큘럼 생성 및 데이터 삽입
			Curriculum newCurriculum = null;
			for (int i = 0; i < curriculums.size(); i++) {

				newCurriculum = new Curriculum();

				newCurriculum.setGid(gid);
				newCurriculum.setTitle(curriculums.get(i).getTitle());
				newCurriculum.setComment(curriculums.get(i).getComment());

				if (!"".equals(schedules[i])) {
					newCurriculum.setDate(ConvertUtil
							.SDconverting(schedules[i]));
				} else {
					newCurriculum.setDate(null);
				}

				newCurriculum.setChapCnt(i + 1);

				specManager.insertCurriculum(newCurriculum);
			}
		}
		
		return "redirect:/gathering/group?gid=" + gid;
	}
	/**
	 * 커리큘럼 수정하기
	 * @param curriculum
	 * @param schedule
	 * @param gid
	 * @return
	 */
	@RequestMapping(value="/updateCurri.do", method=RequestMethod.POST) 
	public String updateCurriculum(@ModelAttribute CurriculumForm curriculumForm
			, @RequestParam(value="schedule", required=false) String[] schedules
			, @RequestParam("gid") int gid
			, BindingResult result) {
		
		// 기존에 존재하던 해당 소모임의 커리큘럼 모두 삭제하기
		specManager.deleteCurriculum(gid);

		// 커리큘럼 업데이트하기
		List<Curriculum> curriculums = curriculumForm.getCurriculums();
		
		if (curriculums != null) {
			// 새로운 커리큘럼 생성 및 데이터 삽입
			Curriculum newCurriculum = null;
			for (int i = 0; i < curriculums.size(); i++) {

				newCurriculum = new Curriculum();

				newCurriculum.setGid(gid);
				newCurriculum.setTitle(curriculums.get(i).getTitle());
				newCurriculum.setComment(curriculums.get(i).getComment());

				if (!"".equals(schedules[i])) {
					newCurriculum.setDate(ConvertUtil
							.SDconverting(schedules[i]));
				} else {
					newCurriculum.setDate(null);
				}

				newCurriculum.setChapCnt(i + 1);

				specManager.insertCurriculum(newCurriculum);
			}
		}

		return "redirect:/gathering/group?gid=" + gid;
	}
	
	/**
	 * 질문 등록하기
	 * @param qna
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addQnA.ajax", method=RequestMethod.POST)
	public Qna addQnAString(@ModelAttribute Qna qna) {
		
		specManager.insertQna(qna);
		Qna resultQna =  specManager.selectQna(qna.getQid());
		
		return resultQna;
	}
	
	
	/**
	 * 질문에 답글달기
	 * @param reply
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addReply.ajax", method=RequestMethod.POST)
	public Reply addReply(@ModelAttribute Reply reply) {
		
		specManager.insertReply(reply);
		Reply resultReply =  specManager.selectReply(reply.getRid());
		
		return resultReply;
	}
	
	
	/**
	 * 질문 및 답글 삭제
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/qnaRemove.ajax")
	public Integer qnaRemve(@RequestParam String type, @RequestParam String id) {
		
		int removeId = Integer.parseInt(id);
		
		if ("qid".equals(type)) {
			// QnA 의 답글들을 먼저지운다.
			specManager.deleteReplys(removeId);
			return specManager.deleteQna(removeId);
		} else if ("rid".equals(type)){
			return specManager.deleteReply(removeId);
		}
		
		return 0;
	}
	
	
	/**
	 * 모임 검색
	 * @param searchGathering
	 * @return
	 */
	@RequestMapping(value="/search.do", method=RequestMethod.POST)
	public String searchGathering(Model model, Gathering searchGathering) {

		System.out.println(searchGathering);
		List<Gathering> selectSearchGathering = gatheringManager.selectSearchGathering(searchGathering);
		System.out.println("location : " + (searchGathering.getLocation() == null) + "/" + ("null".equals(searchGathering.getLocation())));
		System.out.println("field : " + (searchGathering.getField() == null)+ "/" + ("null".equals(searchGathering.getField())));
		System.out.println("name : " + (searchGathering.getName() == null)+ "/" + ("null".equals(searchGathering.getName())));
		
		
		model.addAttribute("gatheringList", selectSearchGathering);
		
		return "client/grouplist";
	}
	/**
	 * 확인된 공지사항 추가하기
	 * @param session
	 * @param nid
	 * @param gid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/identifiedNotice.ajax", method=RequestMethod.GET)
	public String identifiedNotice(HttpSession session, @RequestParam("nid")int nid, @RequestParam("gid")int gid) {
		
		Member loginUser = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		
		IdentifiedNotice notice = new IdentifiedNotice();
		notice.setEmail(loginUser.getEmail());
		notice.setNid(nid);
		notice.setGid(gid);
		
		System.out.println(notice);
		
		alarmManager.insertIdentifiedNotice(notice);
		
		return "success";
	}
	
	private String getSavePhotoPath(HttpServletRequest request, String savePath , String email){
		String realPath = request.getSession().getServletContext().getRealPath("/");
		return realPath + savePath + email + "_";
	}
	
	private int progressedCurri(long diffOfDate[]) {
		
		long value = diffOfDate[0];
		int index = 0;
		
		for (int i = 1; i < diffOfDate.length; i++) {
			if(diffOfDate[i] <= value && diffOfDate[i] >= 0) {
				value = diffOfDate[i];
				index = i;
			}
		}
		
		return index;
	}
}
