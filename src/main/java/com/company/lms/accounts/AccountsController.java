package com.company.lms.accounts;

import com.company.lms.appuser.AppUser;
import com.company.lms.appuser.AppUserService;
import com.company.lms.book.BookService;
import com.company.lms.profile.Profile;
import com.company.lms.profile.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.Base64;

@Controller
@RequestMapping("/accounts")
public class AccountsController {
    private final ProfileService profileService;
    private final AppUserService appUserService;
    private final BookService bookService;

    @Autowired
    public AccountsController(ProfileService profileService, AppUserService appUserService, BookService bookService) {
        this.profileService = profileService;
        this.appUserService = appUserService;
        this.bookService = bookService;
    }

    @GetMapping("/home")
    public ModelAndView getHome(@AuthenticationPrincipal AppUser user) {
        ModelAndView mv = new ModelAndView("accounts/home");
        mv.addObject("user", user);
        mv.addObject("books", bookService.getBooks());
        return mv;
    }

    @GetMapping("/profile")
    public ModelAndView getAddProfile(@AuthenticationPrincipal AppUser user) {
        ModelAndView mv = new ModelAndView("accounts/profile");
        mv.addObject("user", user);
        return mv;
    }

    @GetMapping("/profile/{id}")
    public String getProfileById(@PathVariable Long id, Model model) {
        Profile profile = profileService.getProfileById(id);
        if(profile != null)
            model.addAttribute("profile", profile);
        else
            return "redirect:/accounts/profile";
        return "accounts/viewProfile";
    }

    @PostMapping("/profile/{id}")
    public RedirectView addProfile(@PathVariable Long id,
                                   @RequestParam String gender,
                                   @RequestParam MultipartFile profilePic,
                                   @RequestParam Long phoneNo,
                                   RedirectAttributes attributes) throws IOException {
        Profile p = new Profile();
        p.setId(id);
        p.setAppUser(appUserService.getUserById(id));
        p.setGender(gender);
        p.setProfilePic(Base64.getEncoder().encodeToString(profilePic.getBytes()));
        p.setPhoneNo(phoneNo);
        profileService.addProfile(p);

        attributes.addFlashAttribute("msg", "Profile added successfully!");
        return new RedirectView("/accounts/profile/"+id);
    }

    @GetMapping("/profile/edit/{id}")
    public ModelAndView getEditProfile(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("accounts/editProfile");
        mv.addObject("profile", profileService.getProfileById(id));
        return mv;
    }

    @PostMapping("/profile/edit/{id}")
    public RedirectView editProfile(@PathVariable Long id,
                                    @RequestParam String gender,
                                    @RequestParam MultipartFile profilePic,
                                    @RequestParam Long phoneNo,
                                    RedirectAttributes attributes) throws IOException {
        Profile p = new Profile();
        p.setId(id);
        p.setAppUser(appUserService.getUserById(id));
        p.setGender(gender);
        p.setProfilePic(Base64.getEncoder().encodeToString(profilePic.getBytes()));
        p.setPhoneNo(phoneNo);
        profileService.addProfile(p);
        attributes.addFlashAttribute("msg", "Profile updated successfully!");
        return new RedirectView("/accounts/profile/"+id);
    }
}
