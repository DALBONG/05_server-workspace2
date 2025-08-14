package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		// 원본파일명 ('aaa.jpg')
		String originName = originFile.getName();
		
		// 수정파일 명('2025080714153598765.jpg')
			// 파일 업로드 시간(년월일시분초) + 5자리 랜덤값(10000~99999)
		
		// 1. 파일 업로드 시간(년월일시분초 형태) (String currentTime에 보관)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 (int ranNum)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 3. 원본파일의 확장자 (String ext)
		String ext = originName.substring(/*마지막.의 index*/originName.lastIndexOf(".")); // .jpg
	
		String changeName = currentTime + ranNum + ext;
		
		
		return new File(originFile.getParent(), changeName);
				// 원본 파일명을, 바뀐 파일명으로 바꿔 보내겠다.
	}

}
