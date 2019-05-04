package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

abstract public class Action {
	abstract public void execute (HttpServletRequest request, HttpServletResponse response);
	
	abstract public String getResultPage();
	
	abstract public boolean isRedirect();
}