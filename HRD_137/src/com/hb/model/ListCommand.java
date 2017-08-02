package com.hb.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DAO;
import DBPKG.VO;

public class ListCommand implements Command{
	DAO dao = new DAO();
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<VO>list = new ArrayList<VO>();
			list = dao.getList();
		
		request.setAttribute("list", list);	
		return "modify.jsp";
	}
}
