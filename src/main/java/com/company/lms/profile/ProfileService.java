package com.company.lms.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;

@Service
public class ProfileService {
    private final ProfileRepository profileRepository;

    @Autowired
    public ProfileService(ProfileRepository profileRepository) {
        this.profileRepository = profileRepository;
    }

    public Profile getProfileById(Long id) {
        return profileRepository.findById(id).orElse(null);
    }

    public Profile addProfile(Profile profile) {
        profileRepository.save(profile);
        return profile;
    }

    public Profile updateProfile(Profile profile) {
        return profileRepository.save(profile);
    }

    public String deleteProfile(Long id) {
        if(profileRepository.existsById(id)) {
            profileRepository.deleteById(id);
            return "Deleted successfully!";
        }
        return "Profile doesn't exist!";
    }

    public Integer getTotalMaleCount() {
        return profileRepository.getTotalCountGender("Male");
    }

    public Integer getTotalFemaleCount() {
        return profileRepository.getTotalCountGender("Female");
    }
}
