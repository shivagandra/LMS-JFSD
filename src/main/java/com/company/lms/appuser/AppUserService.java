package com.company.lms.appuser;

import com.company.lms.profile.ProfileRepository;
import com.company.lms.profile.ProfileService;
import com.company.lms.registration.token.ConfirmationToken;
import com.company.lms.registration.token.ConfirmationTokenService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@AllArgsConstructor
public class AppUserService implements UserDetailsService {

    private final BCryptPasswordEncoder passwordEncoder;
    private final static String USER_NOT_FOUND_MSG = "User with email %s not found";
    private final AppUserRepository appUserRepository;

    private final ConfirmationTokenService confirmationTokenService;
    private final ProfileService profileService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return appUserRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException(String.format(USER_NOT_FOUND_MSG, email)));
    }

    public String signUpUser(AppUser appUser) {
        boolean userExists = appUserRepository.findByEmail(appUser.getEmail()).isPresent();
        if(userExists)
            return "Email already taken";

        String encodedPassword = passwordEncoder.encode(appUser.getPassword());
        appUser.setPassword(encodedPassword);

        appUserRepository.save(appUser);

        String token = UUID.randomUUID().toString();
        ConfirmationToken confirmationToken = new ConfirmationToken(
                token, LocalDateTime.now(),
                LocalDateTime.now().plusMinutes(15),
                appUser
        );

        confirmationTokenService.saveConfirmationToken(confirmationToken);

        return token;
    }

    public int enableAppUser(String email) {
        return appUserRepository.enableAppUser(email);
    }

    public List<AppUser> getAllUsers() {
        return appUserRepository.findAll();
    }

    public AppUser getUserById(Long id) {
        return appUserRepository.findById(id).orElse(null);
    }

    public AppUser updateAppUser(AppUser user) {
        appUserRepository.save(user);
        return user;
    }

    @Transactional
    public String deleteUser(Long id) {
        if(appUserRepository.existsById(id)) {
            AppUser user = appUserRepository.findById(id).orElse(null);
            if(user != null) {
                confirmationTokenService.deleteToken(user);
                profileService.deleteProfile(user.getId());
            }
            appUserRepository.deleteById(id);
            return "User deleted successfully!";
        }
        return null;
    }
}
