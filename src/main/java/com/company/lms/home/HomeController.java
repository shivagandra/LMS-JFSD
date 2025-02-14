package com.company.lms.home;

import com.company.lms.contactUs.Message;
import com.company.lms.contactUs.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/")
public class HomeController {
    private final MessageService messageService;

    @Autowired
    public HomeController(MessageService messageService) {
        this.messageService = messageService;
    }

    @GetMapping
    public ModelAndView home() {
        return new ModelAndView("index");
    }

    @GetMapping("getHome")
    public RedirectView accountsHome() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().toString();

        if(role.contains("ADMIN"))
            return new RedirectView("/admin/home");

        return new RedirectView("/accounts/home");
    }

    @GetMapping("login")
    public ModelAndView loginPage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(!(auth instanceof AnonymousAuthenticationToken))
            return  new ModelAndView("forward:/getHome");
        return new ModelAndView("login");
    }

    @GetMapping("contactUs")
    public ModelAndView contactUs() {
        return new ModelAndView("contactUs");
    }

    @PostMapping("contactUs")
    public RedirectView addContactUs(@ModelAttribute Message message, RedirectAttributes attributes) {
        messageService.addMessage(message);
        attributes.addFlashAttribute("msg", "We have received your message");
        return new RedirectView("/contactUs");
    }
}
