package test.main;


import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.json.JSONWriter;

import test.member.dto.MemberDto;

public class MainClass05 {
	public static void main(String[] args) {
				MemberDto dto1=new MemberDto(1,"김구라","노량진");
				MemberDto dto2=new MemberDto(2,"해골","행신동");
				MemberDto dto3=new MemberDto(3,"원숭이","상도동");
				List<MemberDto> list = new ArrayList<MemberDto>();
				list.add(dto1);
				list.add(dto2);
				list.add(dto3);
				
				/*
				    JSONObject dto10=new JSONObject(dto1);
					JSONObject dto20=new JSONObject(dto2);
					JSONObject dto30=new JSONObject(dto3);
					JSONObject dtos=new JSONObject();
					dtos.put("dto1",dto10);
					dtos.put("dto2",dto20);
					dtos.put("dto3", dto30);				
					System.out.println(dtos);
				  */
				
				
												
				String result=JSONWriter.valueToString(list);
				
				System.out.println(result);

	}
}
