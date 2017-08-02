package com.hb.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DAO;
import DBPKG.PVO;


public class InnerJoinCommand implements Command{
	DAO dao = new DAO();
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<PVO>list2 = new ArrayList<>();
		
		list2 = dao.getInnerJoin();
		
		request.setAttribute("list2", list2);
		return "purchaselist.jsp";
	}
}
