package com.company.lms.book;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BookResponse {
    private Long id;
    private String name;
    private Double price;
    private Integer edition;
    private String file;
}
