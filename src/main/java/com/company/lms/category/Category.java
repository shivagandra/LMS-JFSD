package com.company.lms.category;

import com.company.lms.book.Book;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class Category {
    @Id
    @SequenceGenerator(name = "category_sequence", sequenceName = "category_sequence")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "category_sequence")
    private Long id;
    private String name;
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "categories")
    private List<Book> books=new ArrayList<>();

    @Override
    public String toString() {
        return name;
    }
}
