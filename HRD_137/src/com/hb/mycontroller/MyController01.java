package com.hb.mycontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Command;
import com.hb.model.Custno_num_Command;

@WebServlet("/MyController01")
public class MyController01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyController01() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Command comm = new Custno_num_Command();
		
		String path = comm.exec(request, response);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
