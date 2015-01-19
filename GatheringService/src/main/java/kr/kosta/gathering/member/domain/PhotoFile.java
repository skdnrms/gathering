package kr.kosta.gathering.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class PhotoFile {

	private MultipartFile photoFile;

	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
}
