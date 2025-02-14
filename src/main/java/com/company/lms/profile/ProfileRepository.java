package com.company.lms.profile;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileRepository extends JpaRepository<Profile, Long> {
    @Query("SELECT COUNT(p.id) FROM Profile p WHERE p.gender = ?1")
    Integer getTotalCountGender(String gender);
}
