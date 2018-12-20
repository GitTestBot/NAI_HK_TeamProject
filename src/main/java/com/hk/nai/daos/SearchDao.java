package com.hk.nai.daos;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {

	@Autowired
	private SqlSessionTemplate sst;
	private String ns = "com.hk.nai.";
	
	public List<Integer> getScore(String subTitle) {
		List<Integer> list = new ArrayList<Integer>();
		list = sst.selectList(ns+"getScore", subTitle);
		return list;
	}
}
