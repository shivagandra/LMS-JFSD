package com.company.lms.contactUs;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Message {
    @Id
    @SequenceGenerator(name = "contact_us_sequence", sequenceName = "contact_us_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "contact_us_sequence")
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String msg;

    public Message(String firstName, String lastName, String email, String msg) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.msg = msg;
    }
}
