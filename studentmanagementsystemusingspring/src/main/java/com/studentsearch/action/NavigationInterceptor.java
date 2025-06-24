package com.studentsearch.action;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

@SuppressWarnings("deprecation")
public class NavigationInterceptor implements Interceptor {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
	    throw new UnsupportedOperationException("Init method is not supported.");
	}

	@Override
	public void destroy() {
	    throw new UnsupportedOperationException("Destroy method is not supported.");
	}


    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        String actionName = invocation.getAction().getClass().getSimpleName() + "!" + invocation.getProxy().getMethod();
        session.setAttribute("previousPage", actionName);
        return invocation.invoke();
    }
}