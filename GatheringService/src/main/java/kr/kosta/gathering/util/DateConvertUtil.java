package kr.kosta.gathering.util;

import java.util.HashMap;
import java.util.Map;

public class DateConvertUtil {
	
	private static Map<String, String> DATE_MAP;
	
	static {
		DATE_MAP = new HashMap<String, String>();
		DATE_MAP.put("sun", "일");
		DATE_MAP.put("mon", "월");
		DATE_MAP.put("tue", "화");
		DATE_MAP.put("wed", "수");
		DATE_MAP.put("thu", "목");
		DATE_MAP.put("fri", "금");
		DATE_MAP.put("sat", "토");
	}
	
	public static String DateConverter(String DateCode){
		
		return DATE_MAP.get(DateCode);
	}
	
}
