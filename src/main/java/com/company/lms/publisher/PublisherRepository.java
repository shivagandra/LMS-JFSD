package com.company.lms.publisher;

import com.company.lms.book.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PublisherRepository extends JpaRepository<Publisher, Long> {
    @Query("SELECT COUNT(p.id) FROM Publisher p")
    Integer getTotalPublishers();
}
