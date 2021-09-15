package cn.edu.hzvtc.interceptor;

import cn.edu.hzvtc.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception{
        Boolean flg=true;

        String uri=request.getRequestURI();
        if (uri.indexOf("/login") >=0 || uri.indexOf("/commons/")>=0){
            return flg;
        }
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("loginUser");

        if (user!=null){
            if (uri.indexOf("/area")>=0){
                if (user.getUserType()!=1){
                    flg=false;
                }
            }
            if (uri.indexOf("/unit")>=0){
                if (user.getUserType()!=2){
                    flg=false;
                }
            }
            if (uri.indexOf("/msg")>=0){
                if (user.getUserType()!=3){
                    flg=false;
                }
            }
        }else {
            flg=false;
        }
        if (!flg){
            response.sendRedirect(request.getContextPath());
            return false;
        }
        return flg;
    }
}
