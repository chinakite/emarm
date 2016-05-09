/**
 * 
 */
package com.ideamoment.emarm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ideamoment.ideadp.usercontext.UserContext;


/**
 * @author Chinakite
 *
 */
public class PermissionFilter implements Filter {

    /* (non-Javadoc)
     * @see javax.servlet.Filter#destroy()
     */
    @Override
    public void destroy() {

    }

    /* (non-Javadoc)
     * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
     */
    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
                                 throws IOException, ServletException
    {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        
        String reqUrl = req.getRequestURI();
        
        if(reqUrl.equals(req.getContextPath())     
                || reqUrl.equals(req.getContextPath() + "/")
                || reqUrl.indexOf("/css/") >= 0
                || reqUrl.indexOf("/js/") >= 0
                || reqUrl.indexOf("/fonts/") >= 0
                || reqUrl.indexOf("/img/") >= 0
                || reqUrl.indexOf("/plugins/") >= 0
                || reqUrl.indexOf("/uploadTmp/") >= 0
                || reqUrl.toLowerCase().indexOf("login") >= 0) {
            chain.doFilter(request, response);
        }else{
            Object obj = req.getSession().getAttribute(UserContext.SESSION_USER);
            if(obj == null) {
                resp.sendRedirect(req.getContextPath());
            }else{
                chain.doFilter(request, response);
            }
        }
        
    }

    /* (non-Javadoc)
     * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
     */
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}
