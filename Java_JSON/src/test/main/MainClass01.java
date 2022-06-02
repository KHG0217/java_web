package test.main;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONWriter;

public class MainClass01 {
	public static void main(String[] args) {
		//HashMap 객체에 data를 담고 {}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", 1);
		map.put("name", "김구라");
		map.put("isMan", true);
		
		//JSONWritetr 클래스의 static 메소드를 이용해서 JSON 문자열을 얻어낸다.
		String result=JSONWriter.valueToString(map);
		
		System.out.println(result);
		//제이슨 문자열을 웹브라우저 자바스크립트에서 쉽게 변환해서 사용한다.
	}
}
