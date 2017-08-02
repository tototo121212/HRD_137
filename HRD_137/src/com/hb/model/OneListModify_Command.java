package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.DAO;
import DBPKG.VO;

public class OneListModify_Command implements Command{
	DAO dao = new DAO();
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String custno = request.getParameter("custno");
		System.out.println(custno);
		
		VO vo = dao.getOneListModify(custno);
		
		System.out.println(vo.toString());
		request.setAttribute("vo", vo);
		return "modify2.jsp";
	}
}
