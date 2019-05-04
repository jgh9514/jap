package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")

public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ActionServlet() {
        super();
        // TODO Auto-generated constructor stub
		
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String url;
		
		if(uri.indexOf("home")!= -1) {
			url ="/index.jsp";
			forward(request, response, url);
		}else if(uri.indexOf("login")!= -1) {
			url ="/login/login.jsp";
			forward(request, response, url);
		}else {
			//url ="/error.jsp";
			//forward(request, response, url);
		}
		 
	}

}

