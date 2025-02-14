package com.company.lms.category;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public Category getCategoryById(Long id) {
        return categoryRepository.getReferenceById(id);
    }

    public Category addCategory(Category category) {
        categoryRepository.save(category);
        return category;
    }
    public Category update(Category category) {
        categoryRepository.save(category);
        return category;
    }
    public String deleteCategoryById(Long id) {
        if(categoryRepository.existsById(id)) {
            categoryRepository.deleteById(id);
            return "Category deleted successfully!";
        }
        return null;
    }

    public Integer getNoOfCategories() {
        return categoryRepository.getTotalCatgories();
    }
}
