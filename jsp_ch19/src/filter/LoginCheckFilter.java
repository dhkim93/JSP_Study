package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpReqeust = (HttpServletRequest) req;
		HttpSession session = httpReqeust.getSession(false);

		boolean login = false;
		if (session != null) {
			if (session.getAttribute("MEMBER") != null) {
				login = true;
			}
		}
		if(login){
			chain.doFilter(req, resp);
			
		}else{
			RequestDispatcher dispatcher = req.getRequestDispatcher("/loginForm.jsp");
			dispatcher.forward(req, resp);
					
		}
	}

}
