package filters;

import utils.CookiesUtils;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        req.setCharacterEncoding("UTF-8");

        if (req.getRequestURI().endsWith("/login")) {
            if (req.getSession().getAttribute("isLogin") != null) {

                if (req.getSession().getAttribute("isLogin").equals("1")) {
                    resp.sendRedirect("/");
                    return;
                }
            }
        }

        if (!req.getRequestURI().endsWith(".css") &&
                !req.getRequestURI().endsWith(".js")) {
            if (req.getSession().getAttribute("isLogin") == null) {
                req.getSession().setAttribute("isLogin", "0");
                resp.sendRedirect("/login");
                return;
            } else if (req.getSession().getAttribute("isLogin").equals("0")) {
                if (req.getRequestURI().endsWith("/login")) {
                    filterChain.doFilter(req, resp);
                    return;
                } else {
                    resp.sendRedirect("/login");
                    return;
                }
            }
        }
        filterChain.doFilter(req, resp);
    }

    public void destroy() {

    }
}

