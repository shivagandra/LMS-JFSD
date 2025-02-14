package com.company.lms.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/download")
public class BookController {
    private final BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }
    @GetMapping("{id}")
    public ResponseEntity<Resource> download(@PathVariable Long id) {
        Book book = bookService.download(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(book.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\""+book.getFileName()+"\"")
                .body(new ByteArrayResource(book.getFile()));
    }
}
