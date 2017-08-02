package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DAO;
import DBPKG.VO;

public class InsertCommand implements Command{
	DAO dao = new DAO();
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		VO vo = new VO();
		vo.setCustno(request.getParameter("custno"));
		vo.setCustname(request.getParameter("custname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setAddress(request.getParameter("address"));
		vo.setJoindate(request.getParameter("joindate"));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));
		
		System.out.println(vo.toString());
		String res2 = String.valueOf(dao.getInsert(vo));
		System.out.println(res2);
		request.setAttribute("res2", res2);
		
		return "MyController03";
	
	}
}
