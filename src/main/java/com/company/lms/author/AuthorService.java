package com.company.lms.author;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AuthorService {
    private final AuthorRepository authorRepository;

    @Autowired
    public AuthorService(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }

    public List<Author> getAllAuthors() {
        return authorRepository.findAll();
    }

//    @Transactional
    public Author getAuthorById(Long id) {
        return authorRepository.findById(id).orElse(null);
    }

    public Author addAuthor(Author author) {
        authorRepository.save(author);
        return author;
    }

    public Author updateAuthor(Author author) {
        authorRepository.save(author);
        return author;
    }

    public String deleteAuthor(Long id) {
        if(authorRepository.existsById(id)) {
            authorRepository.deleteById(id);
            return "Deleted successfully!";
        }
        return null;
    }

    public Integer getNoOfAuthors() {
        return authorRepository.getTotalAuthors();
    }
}
