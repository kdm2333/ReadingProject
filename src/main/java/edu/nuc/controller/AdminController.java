package edu.nuc.controller;

import edu.nuc.entity.Book;
import edu.nuc.entity.User;
import edu.nuc.service.BookService;
import edu.nuc.service.UserCommentService;
import edu.nuc.service.UserService;
import edu.nuc.untils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.security.krb5.internal.Ticket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

/**
 * @Author: 裴佳琦
 * @CreateDate: 2019/5/29 10:27
 * @Description:
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserCommentService userCommentService;


    @RequestMapping("/admin")
    public String toAdmin(HttpSession session){
        User user = (User) session.getAttribute("user");

        int type = user.getType();
        if(type == Constant.TEACHER && type == Constant.STUDENT ){
            return "userMain";
        }else if (type == Constant.MANAGER){
            return "adminMain";
        }
        return "redirect:../book/selectBookForMain";
    }



    @RequestMapping("/toaddbook")
    public String toaddbook(){
        return "addbook";
    }

    @RequestMapping("/addbook")
    public String addBook(HttpServletRequest request, Model model, Book book, MultipartFile pic) {

        System.out.println("======"+book.toString());

        String path = request.getSession().getServletContext().getRealPath("img/");
        String picname = pic.getOriginalFilename();
        String pictureurl = UUID.randomUUID()+picname;
        File file = new File(path+pictureurl);
        try {
            pic.transferTo(file);
        }catch (Exception e){
            e.printStackTrace();
        }
        book.setPictureurl(pictureurl);

        boolean bool = bookService.insertBook(book);
        if (bool) {
            model.addAttribute("msg", "添加成功！");
            return "redirect:../book/selectAllBook";
        } else {
            model.addAttribute("msg", "添加失败！");
            return "redirect:../book/selectAllBook";
        }

    }



    @RequestMapping("getBookById")
    @ResponseBody
    public Book getBookById(int bookid) {
        Book book = new Book();
        book = bookService.selectBookByBookId(bookid);
        return book;
    }

    @RequestMapping("edit")
    @ResponseBody
    public boolean edit(Book book) {
        boolean flag = bookService.updateBook(book);
        return flag;
    }


}
