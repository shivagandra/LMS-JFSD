package com.company.lms.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookService {
    private final BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public Book addBook(Book book) {
        bookRepository.save(book);
        return book;
    }

    public Book updateBook(Book book) {
        bookRepository.save(book);
        return book;
    }

    public List<Book> getBooks() {
        return bookRepository.findAll();
    }

    public Book getBookById(Long id) {
        return bookRepository.findById(id).orElse(new Book());
    }

    public List<BookResponse> getAllBooks() {
        List<BookResponse> bookResponses = new ArrayList<>();
        for(Book book: bookRepository.findAll()) {
            bookResponses.add(new BookResponse(
                    book.getId(),
                    book.getName(),
                    book.getPrice(),
                    book.getEdition(),
                    ServletUriComponentsBuilder.fromCurrentContextPath()
                            .path("/download/")
                            .path(Long.toString(book.getId()))
                            .toUriString()
            ));
        }
        return bookResponses;
    }

    public String deleteBook(Long id) {
        if(bookRepository.existsById(id)) {
            bookRepository.deleteById(id);
            return "Book deleted successfully!";
        }
        return null;
    }

    public Book download(Long id) {
        return bookRepository.findById(id).orElse(null);
    }

    public Integer getNoOfBooks() {
        return bookRepository.getTotalBooks();
    }
}
