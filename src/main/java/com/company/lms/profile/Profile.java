package com.company.lms.profile;

import com.company.lms.appuser.AppUser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Profile {
    @Id
    private Long id;
    @OneToOne
    private AppUser appUser;
    private String gender;
    @Lob
    private String profilePic;
    private Long phoneNo;
}
