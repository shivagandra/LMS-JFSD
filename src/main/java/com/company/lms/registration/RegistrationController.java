package com.company.lms.registration;

import com.company.lms.appuser.AppUser;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path="/registration")
@AllArgsConstructor
public class RegistrationController {
    private RegistrationService registrationService;


    @GetMapping(path = "confirm")
    public ModelAndView confirm(@RequestParam("token") String token) {
        String msg = registrationService.confirmToken(token);
        ModelAndView mv=new ModelAndView("token");
        mv.addObject("msg", msg);
        return mv;
    }

    @GetMapping("confirmation")
    public ModelAndView getConfirmationMessage() {
        return new ModelAndView("confimation");
    }

    @GetMapping
    public ModelAndView getRegistration()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(!(auth instanceof AnonymousAuthenticationToken))
            return  new ModelAndView("forward:/getHome");
        return new ModelAndView("registration");
    }

    @PostMapping
    public String register(RegistrationRequest request, Model m) {
        String token = registrationService.register(request);
        if(token.contains("Email already taken")) {
            m.addAttribute("error", token);
            return "registration";
        }
        
        return "redirect:/registration/confirmation";
    }

}
