package kr.kosta.gathering.member;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.kosta.gathering.member.domain.Member;
import kr.kosta.gathering.member.domain.PhotoFile;
import kr.kosta.gathering.member.domain.UserInfo;
import kr.kosta.gathering.member.service.MemberManager;
import kr.kosta.gathering.reunion.domian.RegistGathering;
import kr.kosta.gathering.reunion.service.GatheringManager;
import kr.kosta.gathering.util.ConvertUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	MemberManager memberManager;
	
	@Autowired
	GatheringManager gatheringManager;

	/**
	 * 로그인
	 * @param session
	 * @param email
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="userfilter.ajax", method=RequestMethod.POST)
	public String login(HttpSession session, @RequestParam("email")String email
			, @RequestParam(value="password", required=false)String password) {

		Member loginUser = memberManager.selectMember(email);
		
		if (loginUser != null) {
			List<RegistGathering> registGatherings = gatheringManager.selectRegistGatheringList(loginUser.getEmail());
			loginUser.setRegistGatherings(registGatherings);
		}
		
		// 로그인 필터링
		if (loginUser != null) {
			if (password != null) {
				if (loginUser.getPassword().equals(password)) {
					session.setAttribute(UserInfo.LOGIN_INFO, loginUser);
					return "success";
				} else {
					return "failPassword";
				}
			}
		} else {
			return "useableId";
		}
		
		return "failId";
	}
	
	/**
	 * 회원 등록하기
	 * @param session
	 * @param member
	 * @param userBirthday
	 * @return
	 */
	@RequestMapping(value="registMember.do", method=RequestMethod.POST) 
	public String registMember(HttpSession session, @ModelAttribute Member member
			, @RequestParam(value="userBirthday", required = false)String userBirthday) {
		
		
		System.out.println(userBirthday);
		if(userBirthday != null && userBirthday.length() != 0) {
			member.setBirthday(ConvertUtil.SDconverting(userBirthday));
		}
		System.out.println(member);
		
		// 멤버 등록
		Member newUser = null;
		if(member != null) {
			
			newUser = member;
			newUser.setPhoto("member-defult.png");
			memberManager.insertMember(newUser);
			session.setAttribute(UserInfo.LOGIN_INFO, newUser);
			
		}
		
		return "redirect:/";
	}
	
	/**
	 * 사용자 정보 페이지 이동
	 * @return
	 */
	@RequestMapping("moveUserPage")
	public String moveUserPage() {
		
		return "client/setting";
	}
	
	/**
	 * 사용자 정보 수정하기
	 * @param session
	 * @param member
	 * @param photofile
	 * @return
	 */
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public String updateMember(HttpServletRequest request, HttpSession session
			, @ModelAttribute("member") Member member
			, @ModelAttribute("photoFile")PhotoFile photofile) {
		
		Member loginMember = (Member)session.getAttribute(UserInfo.LOGIN_INFO);
		
		// 이미지 저장
		if(photofile != null && photofile.getPhotoFile().getSize() > 0) {
			String photoName = ConvertUtil.savePhoto(photofile.getPhotoFile(), getSavePhotoPath(request, ConvertUtil.MEMBER_PHOTOPATH, member.getEmail()));
			loginMember.setPhoto(photoName);
		} 
		// 패스워드 저장
		String password = member.getPassword();
		if(password != null && password.length() != 0) {
			loginMember.setPassword(member.getPassword());
		}
		// 기타 정보 저장
		loginMember.setPhone(member.getPhone());
		loginMember.setGender(member.getGender());
		loginMember.setLocation(member.getLocation());
		
		memberManager.updateMember(loginMember);
		session.setAttribute(UserInfo.LOGIN_INFO, loginMember);
		
		return "redirect:/";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute(UserInfo.LOGIN_INFO);
		
		return "redirect:/";
	}
	
	private String getSavePhotoPath(HttpServletRequest request, String savePath , String email){
		String realPath = request.getSession().getServletContext().getRealPath("/");
		return realPath + savePath + email + "_";
	}
	
	/**
	 * 이미지 업로드하기
	 * @param photofile
	 * @return
	 */
	/*
	@ResponseBody
	@RequestMapping(value="registPhoto.ajax", method=RequestMethod.POST)
	public String registPhoto(@ModelAttribute("photoFile")PhotoFile photofile) {
		
		String photoPath = ConvertUtil.savePhoto(photofile.getPhoto(), ConvertUtil.MEMBER_PATH);
		
		return photoPath;
	}
	*/
}