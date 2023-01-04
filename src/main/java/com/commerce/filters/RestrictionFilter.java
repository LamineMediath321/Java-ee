package com.commerce.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RestrictionFilter implements Filter {
      
	public static final String ACCES_PUBLIC ="/home";
	public static final String ATT_SESSION_USER ="email";

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		/* Cast des objets request et response */
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		//chain.doFilter(request, response);
		//Récupération de la session depuis la requête */
		HttpSession session = request.getSession();
		if ( session.getAttribute("email") !=null && session.getAttribute("role").equals("admin") ) {
			/* Affichage de la page restreinte */
			chain.doFilter( request, response );
				
		} else {
			/* Redirection vers la page publique */
			response.sendRedirect( request.getContextPath() +ACCES_PUBLIC );
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
