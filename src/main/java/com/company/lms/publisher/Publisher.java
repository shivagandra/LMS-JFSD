package com.company.lms.publisher;

import com.company.lms.book.Book;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Publisher {
    @Id
    @SequenceGenerator(name = "publisher_sequence", sequenceName = "publisher_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "publisher_sequence")
    private Long id;
    private String name;
    private String address;
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "publishers")
    private List<Book> books = new ArrayList<>();

    @Override
    public String toString() {
        return name+", ";
    }
}
