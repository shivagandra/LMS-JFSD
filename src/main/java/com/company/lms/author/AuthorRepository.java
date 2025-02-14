package com.company.lms.author;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {
    @Query("SELECT COUNT(a.id) FROM Author a")
    Integer getTotalAuthors();
}
