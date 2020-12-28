package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginService;
import vo.ActionForward;
import vo.MemberBean;

public class LoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberBean member = new MemberBean();
		
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		
		LoginService LoginService = new LoginService();
		boolean loginResult = LoginService.login(member);
		ActionForward forward=null;
		if(loginResult) {
			forward = new ActionForward();
			
			session.setAttribute("id", member.getId());
			forward.setRedirect(true);	
			forward.setPath("./index.do");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('로그인실패');location.href='./Login.do';</script>");
		}
		return forward;
	}

}
