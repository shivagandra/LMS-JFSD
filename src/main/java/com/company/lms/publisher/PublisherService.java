package com.company.lms.publisher;

import com.company.lms.book.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublisherService {
    private final PublisherRepository publisherRepository;

    @Autowired
    public PublisherService(PublisherRepository publisherRepository) {
        this.publisherRepository = publisherRepository;
    }

    public Publisher addPublisher(Publisher publisher) {
        publisherRepository.save(publisher);
        return publisher;
    }

    public List<Publisher> getAllBookPublishers() {
        return publisherRepository.findAll();
    }

    public Publisher getPublisherById(Long id) {
        return publisherRepository.findById(id).orElse(null);
    }

    public List<Book> getBooksByPublisher(Long id) {
        return publisherRepository.findById(id).orElseThrow().getBooks();
    }

    public Publisher updatePublisher(Publisher publisher) {
        publisherRepository.save(publisher);
        return publisher;
    }

    public String deletePublisherById(Long id) {
        if(publisherRepository.existsById(id)) {
            publisherRepository.deleteById(id);
            return "Publisher deleted successfully!";
        }
        return "Publisher doesn't exist!";
    }

    public Integer getNoOfPublishers() {
        return publisherRepository.getTotalPublishers();
    }
}
