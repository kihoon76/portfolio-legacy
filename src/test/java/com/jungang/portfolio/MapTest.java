package com.jungang.portfolio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class MapTest {

	@Test
	public void testMap() {
		List<Map<String, String>> list = new ArrayList<>();
		Map<String, String> map = new HashMap();
		map.put("auth", "y");
		map.put("cnt", "2");
		
		list.add(map);
		
		for(Map<String,String> m : list) {
			System.out.println(m.get("auth"));
		}
		
	}
}
