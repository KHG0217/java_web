package test.main;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONWriter;

public class MainClass02 {
	public static void main(String[] args) {
		List<String> names=new ArrayList<String>();
		//[]
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
		String result=JSONWriter.valueToString(names);
		
		System.out.println(result);
	}
}
