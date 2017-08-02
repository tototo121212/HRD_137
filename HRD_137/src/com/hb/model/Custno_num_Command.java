package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DAO;

public class Custno_num_Command implements Command{
	DAO dao = new DAO();
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String res = dao.getcustno_num();
		System.out.println(res);
		
		request.setAttribute("res", res);
		return "insert.jsp";
	}
}
