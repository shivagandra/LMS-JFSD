package com.company.lms.admin;

import com.company.lms.appuser.AppUser;
import com.company.lms.appuser.AppUserRole;
import com.company.lms.appuser.AppUserService;
import com.company.lms.author.Author;
import com.company.lms.author.AuthorService;
import com.company.lms.book.Book;
import com.company.lms.book.BookService;
import com.company.lms.category.Category;
import com.company.lms.category.CategoryService;
import com.company.lms.contactUs.MessageService;
import com.company.lms.profile.ProfileService;
import com.company.lms.publisher.Publisher;
import com.company.lms.publisher.PublisherService;
import com.company.lms.registration.RegistrationRequest;
import com.company.lms.registration.RegistrationService;
import com.company.lms.registration.token.ConfirmationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final PublisherService publisherService;
    private final BookService bookService;
    private final AuthorService authorService;
    private final CategoryService categoryService;

    private final MessageService messageService;

    private final AppUserService appUserService;

    private final ProfileService profileService;

    private final RegistrationService registrationService;

    @Autowired
    public AdminController(PublisherService publisherService,
                           BookService bookService,
                           AuthorService authorService,
                           CategoryService categoryService,
                           MessageService messageService,
                           AppUserService appUserService,
                           ProfileService profileService, RegistrationService registrationService) {
        this.publisherService = publisherService;
        this.bookService = bookService;
        this.authorService = authorService;
        this.categoryService = categoryService;
        this.messageService = messageService;
        this.appUserService = appUserService;
        this.profileService = profileService;
        this.registrationService = registrationService;
    }


    @GetMapping("/home")
    public ModelAndView getAdminHome() {
        ModelAndView mv = new ModelAndView("admin/adminHome");
        mv.addObject("no_of_books", bookService.getNoOfBooks());
        mv.addObject("no_of_authors", authorService.getNoOfAuthors());
        mv.addObject("no_of_categories", categoryService.getNoOfCategories());
        mv.addObject("no_of_publishers", publisherService.getNoOfPublishers());
        mv.addObject("maleCount", profileService.getTotalMaleCount());
        mv.addObject("femaleCount", profileService.getTotalFemaleCount());
        return mv;
    }

    // Book Route Mapping
    @GetMapping("/book")
    public ModelAndView manageBook() {
        ModelAndView mv = new ModelAndView("admin/adminBook");
        mv.addObject("books", bookService.getBooks());
        return mv;
    }

    @GetMapping("/book/{id}")
    public ModelAndView getBookById(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/bookView");
        mv.addObject("book", bookService.getBookById(id));
        return mv;
    }

    @GetMapping("/book/edit/{id}")
    public ModelAndView editBookById(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/bookEdit");
        mv.addObject("book", bookService.getBookById(id));
        mv.addObject("publishers", publisherService.getAllBookPublishers());
        mv.addObject("authors", authorService.getAllAuthors());
        mv.addObject("categories", categoryService.getAllCategories());
        return mv;
    }

    @GetMapping("{id}")
    @ResponseBody
    public List<Book> getBooksByPublisher(@PathVariable Long id) {
        return publisherService.getBooksByPublisher(id);
    }

    @GetMapping("/book/addBook")
    public ModelAndView getAddBook(Model model) {
        ModelAndView mv = new ModelAndView("admin/addBook");
        mv.addObject("categories", categoryService.getAllCategories());
        mv.addObject("authors", authorService.getAllAuthors());
        mv.addObject("publishers", publisherService.getAllBookPublishers());
        mv.addObject("maleCount");
        mv.addObject("femaleCount");
        return mv;
    }
    @PostMapping("/book/addBook")
    @ResponseBody
    public RedirectView addBook(@RequestParam String name,
                        @RequestParam Double price,
                        @RequestParam Integer edition,
                        @RequestParam MultipartFile file,
                        @RequestParam MultipartFile picture,
                        @RequestParam List<Category> categories,
                        @RequestParam List<Author> authors,
                        @RequestParam List<Publisher> publishers,
                        RedirectAttributes attributes) throws IOException {
        bookService.addBook(new Book(name,
                price,
                edition,
                file.getOriginalFilename(),
                file.getContentType(),
                file.getBytes(),
                Base64.getEncoder().encodeToString(picture.getBytes()),
                categories,
                authors,
                publishers));
        attributes.addFlashAttribute("msg", "Book added successfully");
        return new RedirectView("/admin/book/");
    }

    @PostMapping("/book/edit")
    public RedirectView editBook(@RequestParam Long id,
                                 @RequestParam String name,
                                 @RequestParam Double price,
                                 @RequestParam Integer edition,
                                 @RequestParam String fileName,
                                 @RequestParam String fileType,
                                 @RequestParam MultipartFile file,
                                 @RequestParam MultipartFile picture,
                                 @RequestParam List<Category> categories,
                                 @RequestParam List<Author> authors,
                                 @RequestParam List<Publisher> publishers,
                                 RedirectAttributes attributes) throws IOException {
        bookService.updateBook(new Book(id,
                name,
                price,
                edition,
                fileName,
                fileType,
                file.getBytes(),
                Base64.getEncoder().encodeToString(picture.getBytes()),
                categories,
                authors,
                publishers));
        attributes.addFlashAttribute("msg", "Book edited successfully");
        return new RedirectView("/admin/book");
    }

    @GetMapping("/book/delete/{id}")
    public RedirectView deleteBook(@PathVariable Long id, RedirectAttributes attributes) {
        if(bookService.deleteBook(id) == null)
            attributes.addFlashAttribute("error", "Book doesn't exist");
        else
            attributes.addFlashAttribute("msg", "Book deleted successfully!");
        return new RedirectView("/admin/book");
    }

    // Author Route Mapping
    @GetMapping("/author")
    public ModelAndView getAuthors() {
        ModelAndView mv = new ModelAndView("admin/adminAuthor");
        mv.addObject("authors", authorService.getAllAuthors());
        return mv;
    }

    @GetMapping("/author/addAuthor")
    public ModelAndView getAddAuthor() {
        return new ModelAndView("admin/addAuthor");
    }

    @PostMapping("/author/addAuthor")
    public RedirectView addAuthor(@ModelAttribute Author author, RedirectAttributes attributes) {
        authorService.addAuthor(author);
        attributes.addFlashAttribute("msg", "Author added successfully!");
        return new RedirectView("/admin/author");
    }

    @GetMapping("/author/{id}")
    public ModelAndView getAuthorById(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/authorView");
        mv.addObject("author", authorService.getAuthorById(id));
        return mv;
    }

    @GetMapping("/author/edit/{id}")
    public ModelAndView editAuthor(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/authorEdit");
        mv.addObject("author", authorService.getAuthorById(id));
        mv.addObject("books", bookService.getAllBooks());
        return mv;
    }

    @PostMapping("/author/edit")
    public RedirectView updateAuthor(@ModelAttribute Author author, RedirectAttributes attributes) {
        authorService.updateAuthor(author);
        attributes.addFlashAttribute("msg", "Author edited successfully");
        return new RedirectView("/admin/author");
    }

    @GetMapping("/author/delete/{id}")
    public RedirectView deleteAuthor(@PathVariable Long id, RedirectAttributes attributes) {
        if(authorService.deleteAuthor(id) == null)
            attributes.addFlashAttribute("error", "Author doesn't exist");
        else
            attributes.addFlashAttribute("msg", "Author deleted successfully!");
        return new RedirectView("/admin/author");
    }

    // Category Route Mapping
    @GetMapping("/category")
    public ModelAndView getCategories() {
        ModelAndView mv = new ModelAndView("admin/adminCategory");
        mv.addObject("categories", categoryService.getAllCategories());
        return mv;
    }

    @GetMapping("/category/addCategory")
    public ModelAndView getAddCategory() {
        return new ModelAndView("admin/addCategory");
    }

    @PostMapping("/category/addCategory")
    public RedirectView addCategory(@ModelAttribute Category category, RedirectAttributes attributes) {
        categoryService.addCategory(category);
        attributes.addFlashAttribute("msg", "Category added successfully!");
        return new RedirectView("/admin/category");
    }

    @GetMapping("/category/{id}")
    public ModelAndView getCategoryById(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/categoryView");
        mv.addObject("category", categoryService.getCategoryById(id));
        return mv;
    }

    @GetMapping("/category/edit/{id}")
    public ModelAndView editCategory(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/categoryEdit");
        mv.addObject("category", categoryService.getCategoryById(id));
        mv.addObject("books", bookService.getAllBooks());
        return mv;
    }

    @PostMapping("/category/edit")
    public RedirectView updateCategory(@ModelAttribute Category category, RedirectAttributes attributes) {
        System.out.println("I am getting updated");
        categoryService.update(category);
        attributes.addFlashAttribute("msg", "Category edited successfully");
        return new RedirectView("/admin/category");
    }

    @GetMapping("/category/delete/{id}")
    public RedirectView deleteCategory(@PathVariable Long id, RedirectAttributes attributes) {
        if(categoryService.deleteCategoryById(id) == null)
            attributes.addFlashAttribute("error", "Category doesn't exist");
        else
            attributes.addFlashAttribute("msg", "Category deleted successfully!");
        return new RedirectView("/admin/category");
    }

    // Publisher Route Mapping

    @GetMapping("/publisher")
    public ModelAndView getPublisher() {
        ModelAndView mv = new ModelAndView("admin/adminPublisher");
        mv.addObject("publishers", publisherService.getAllBookPublishers());
        return mv;
    }

    @GetMapping("/publisher/addPublisher")
    public ModelAndView getAddPublisher() {
        return new ModelAndView("admin/addPublisher");
    }

    @PostMapping("/publisher/addPublisher")
    public RedirectView addPublisher(@ModelAttribute Publisher publisher, RedirectAttributes attributes) {
        publisherService.addPublisher(publisher);
        attributes.addFlashAttribute("msg", "Publisher added successfully!");
        return new RedirectView("/admin/publisher");
    }

    @GetMapping("/publisher/{id}")
    public ModelAndView getPublisherById(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/publisherView");
        mv.addObject("publisher", publisherService.getPublisherById(id));
        return mv;
    }

    @GetMapping("/publisher/edit/{id}")
    public ModelAndView getEditPublisher(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/publisherEdit");
        mv.addObject("publisher", publisherService.getPublisherById(id));
        mv.addObject("books", bookService.getAllBooks());
        return mv;
    }

    @PostMapping("/publisher/edit")
    public RedirectView editPublisher(@ModelAttribute Publisher publisher, RedirectAttributes attributes) {
        publisherService.updatePublisher(publisher);
        attributes.addFlashAttribute("msg", "Publisher edited successfully!");
        return new RedirectView("/admin/publisher");
    }

    @GetMapping("/publisher/delete/{id}")
    public RedirectView deletePublisher(@PathVariable Long id, RedirectAttributes attributes) {
        if(publisherService.deletePublisherById(id) == null)
            attributes.addFlashAttribute("error", "Publisher doesn't exist");
        else
            attributes.addFlashAttribute("msg", "Publisher deleted successfully!");
        return new RedirectView("/admin/publisher");
    }

    // Message Route Mapping
    @GetMapping("/message")
    public ModelAndView getMessages() {
        ModelAndView mv = new ModelAndView("admin/adminMessage");
        mv.addObject("messages", messageService.getMessages());
        return mv;
    }

    // Accounts Route Mapping
    @GetMapping("/accounts")
    public ModelAndView getAccounts() {
        ModelAndView mv = new ModelAndView("admin/adminAccounts");
        mv.addObject("accounts", appUserService.getAllUsers());
        return mv;
    }

    @GetMapping("/accounts/addAccount")
    public ModelAndView getAddAccount() {
        return new ModelAndView("admin/addAccount");
    }

    @PostMapping("/accounts/addAccount")
    public RedirectView addAccount(@ModelAttribute RegistrationRequest request, RedirectAttributes attributes) {
        String token = registrationService.register(request);
        if(token.contains("Email already taken")) {
            attributes.addFlashAttribute("error", token);
            return new RedirectView("/admin/addAccount");
        }
        attributes.addFlashAttribute("msg",
                "Account added successfully! Activation link is send to respective email address");
        return new RedirectView("/admin/accounts");
    }

    @GetMapping("/accounts/{id}")
    public ModelAndView getAccountById(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/accountsView");
        mv.addObject("account", appUserService.getUserById(id));
        return mv;
    }

    @GetMapping("/accounts/edit/{id}")
    public ModelAndView getEditAccount(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("admin/accountsEdit");
        AppUser account = appUserService.getUserById(id);
        mv.addObject("account", account);
        List<AppUserRole> roles = new ArrayList<>(List.of(AppUserRole.USER, AppUserRole.ADMIN));;
        if(account.getAppUserRole().name().contains("ADMIN"))
            roles = new ArrayList<AppUserRole>(List.of(AppUserRole.ADMIN, AppUserRole.USER));

        mv.addObject("roles", roles);
        return mv;
    }

    @PostMapping("/accounts/edit")
    public RedirectView editAccount(@RequestParam Long id,
                                    @RequestParam String firstName,
                                    @RequestParam String lastName,
                                    @RequestParam String email,
                                    @RequestParam AppUserRole appUserRole,
                                    RedirectAttributes attributes) {
        AppUser user = appUserService.getUserById(id);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setAppUserRole(appUserRole);
        appUserService.updateAppUser(user);
        attributes.addFlashAttribute("msg", "Account updated successfully!");
        return new RedirectView("/admin/accounts");
    }

    @GetMapping("/accounts/delete/{id}")
    public RedirectView deleteAccount(@PathVariable Long id, RedirectAttributes attributes) {
        if(appUserService.deleteUser(id) == null)
            attributes.addFlashAttribute("error", "Account doesn't exist");
        else {
            attributes.addFlashAttribute("msg", "Account deleted successfully!");
        }

        return new RedirectView("/admin/accounts");
    }
}
