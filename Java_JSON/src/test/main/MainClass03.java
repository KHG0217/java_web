package test.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONWriter;

/*
 * 	run 했을때 아래와 동일한 형식의 문자열이 출력되로록 해 보세요.
 * 
 * 	{
 *		"name":"김승연",
 *		"addr":"경기도",
 *		"food":["딸기,"떡볶이"]
 *
 * 
 * 	}
 * 
 * 	hint
 * 
 * 	Map<String,Object>
 * 
 */
public class MainClass03 {
	public static void main(String[] args) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> food =new ArrayList<String>();
		food.add("딸기");
		food.add("떡볶이");
		
		map.put("name", "김승연");
		map.put("addr", "경기도");
		map.put("food",food);
		String result=JSONWriter.valueToString(map);
		
		System.out.println(result);
		
		

	}
}
