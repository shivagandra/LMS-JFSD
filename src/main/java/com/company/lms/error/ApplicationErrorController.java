package com.company.lms.error;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ApplicationErrorController implements ErrorController {
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value())
                return "error/404";
            else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value())
                return "error/500";
            else if(statusCode == HttpStatus.FORBIDDEN.value())
                return "error/403";
        }
        return "error";
    }

    @RequestMapping("/404.html")
    public String render404(Model model) {
        // Add model attributes
        return "404";
    }
}
