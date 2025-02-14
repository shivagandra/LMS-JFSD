package com.company.lms.book;

import com.company.lms.author.Author;
import com.company.lms.category.Category;
import com.company.lms.publisher.Publisher;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    @Id
    @SequenceGenerator(name = "book_sequence", sequenceName = "book_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "book_sequence")
    private Long id;
    private String name;
    private Double price;
    private Integer edition;
    private String fileName;
    private String fileType;
    @Lob
    private byte[] file;
    @Lob
//    @Column(columnDefinition = "MEDIUMBLOB")
    private String picture;

    @ManyToMany
    private List<Category> categories = new ArrayList<>();
    @ManyToMany
    private List<Author> authors = new ArrayList<>();
    @ManyToMany
    private List<Publisher> publishers = new ArrayList<>();

    public Book(String name,
                Double price,
                Integer edition,
                String fileName,
                String fileType,
                byte[] file,
                String picture,
                List<Category> categories,
                List<Author> authors,
                List<Publisher> publishers) {
        this.name = name;
        this.price = price;
        this.edition = edition;
        this.fileName = fileName;
        this.fileType = fileType;
        this.file = file;
        this.picture = picture;
        this.categories = categories;
        this.authors = authors;
        this.publishers = publishers;
    }

    @Override
    public String toString() {
        return name;
    }
}
