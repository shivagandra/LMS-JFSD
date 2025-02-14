package com.company.lms.author;

import com.company.lms.book.Book;
import lombok.*;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Author {
    @Id
    @SequenceGenerator(name = "author_sequence", sequenceName = "author_sequence")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "author_sequence")
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "authors")
    private List<Book> books = new ArrayList<>();

    public Author(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    @Override
    public String toString() {
        return firstName+" "+lastName+", ";
    }
}
