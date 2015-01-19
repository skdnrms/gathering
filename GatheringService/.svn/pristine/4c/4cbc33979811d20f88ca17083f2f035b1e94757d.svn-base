package kr.kosta.gathering.util;

import java.util.HashMap;
import java.util.Map;

public class FieldConvertUtil {
	
	private static Map<String, String> FIELD_MAP;
	
	static {
		FIELD_MAP = new HashMap<String, String>();
		
		FIELD_MAP.put("A01", "어학");
		FIELD_MAP.put("A02", "IT");
		FIELD_MAP.put("A03", "취업");
		FIELD_MAP.put("A04", "기타");
		
		FIELD_MAP.put("B01", "영어");
		FIELD_MAP.put("B02", "일어");
		FIELD_MAP.put("B03", "중국어");
		FIELD_MAP.put("B04", "독일어");
		FIELD_MAP.put("B05", "프로그래밍");
		FIELD_MAP.put("B06", "자격증");
		FIELD_MAP.put("B07", "적성검사");
		FIELD_MAP.put("B08", "면접");
		
		FIELD_MAP.put("C01", "회화");
		FIELD_MAP.put("C02", "문법");
		FIELD_MAP.put("C03", "JAVA");
		FIELD_MAP.put("C04", "C");
		FIELD_MAP.put("C05", "DB");
		FIELD_MAP.put("C06", "정보처리기사");
		FIELD_MAP.put("C07", "MOS");
		FIELD_MAP.put("C08", "SSAT");
		FIELD_MAP.put("C09", "기술면접");
		FIELD_MAP.put("C10", "영어면접");
		
	}
	
	public static String fieldNumberConverter(String fieldCode){
		return FIELD_MAP.get(fieldCode);
	}
	
}
