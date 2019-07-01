package edu.nuc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.nuc.entity.Book;
import edu.nuc.entity.User;
import edu.nuc.entity.Usercomment;
import edu.nuc.entity.UsercommentExample;
import edu.nuc.service.BookService;
import edu.nuc.service.UserCommentService;
import edu.nuc.untils.BookSearch;
import edu.nuc.untils.DateUntils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("book")
public class BookController {

    @Resource
    private BookService bookService;

    @Resource
    private UserCommentService userCommentService;


    /*
    **  删除书籍
    */
    @RequestMapping("/updateBookStatus")
    public String updateBookStatus(HttpServletRequest request, int bookId, int status, Model model) {
        Book book = new Book();
        book.setBookid(bookId);
        book.setStatus(status);
        boolean bool = bookService.updateBook(book);
        if (bool) {
            if (status == 1){
                UsercommentExample example = new UsercommentExample();
                UsercommentExample.Criteria criteria = example.createCriteria();
                criteria.andBookidEqualTo(bookId).andStatusEqualTo(2);
                Usercomment userComment = new Usercomment();
                userComment.setStatus(1);

                boolean bool2 = userCommentService.updateComentByBookId(userComment,example);

            }else if (status == 2 ){
                UsercommentExample example = new UsercommentExample();
                UsercommentExample.Criteria criteria = example.createCriteria();
                criteria.andBookidEqualTo(bookId).andStatusEqualTo(1);
                Usercomment userComment = new Usercomment();
                userComment.setStatus(2);

                boolean bool2 = userCommentService.updateComentByBookId(userComment,example);
            }
            model.addAttribute("msg", "修改成功！");
            return "redirect:../book/selectAllBook";
        } else {
            model.addAttribute("msg", "修改失败！");
            return "redirect:../book/selectAllBook";
        }

    }

    /*
    **  查询所有书籍
    */
    @RequestMapping("/selectAllBook")
    public String selectAllBook(Model model, BookSearch bookSearch) {

        if (bookSearch == null){
            bookSearch = new BookSearch();
        }
        System.out.print("================"+bookSearch.getAuthor());
        PageHelper.startPage(bookSearch.getPageNum(),bookSearch.getPageSize());
        List<Book> list = bookService.selectBookBySearch(bookSearch);
        PageInfo<Book> pageInfo = new PageInfo<Book>(list);
        model.addAttribute("page",pageInfo);
        model.addAttribute("search",bookSearch);
        return "bookList";
    }


    /*
    **  按作者查询书籍
    */
    @RequestMapping("/selectBookByAuthor")
    public String selectBookByAuthor(Model model, String author) {
        List<Book> list = bookService.selectBookListByAuthor(author);
        model.addAttribute("booklist", list);
        return "bookList";
    }

    /*
    **  按书名查询书籍
    */
    @RequestMapping("/selectBookByName")
    public String selectBookByName(Model model, String bookName) {
        List<Book> list = bookService.selectBookListByBookName(bookName);
        model.addAttribute("booklist", list);
        return "bookList";
    }

    /*
    **  按类型查询书籍
    */
    @RequestMapping("/selectBookByType")
    public String selectBookByType(Model model, int type) {
        List<Book> list = bookService.selectBookListByBookType(type);
        model.addAttribute("booklist", list);
        return "bookList";
    }

    /*
    **  查询本周新增书籍
    */
    @RequestMapping("/selectBookInWeek")
    public String selectBookInWeek(Model model){
        Date startDate = DateUntils.startOfWeek();
        List<Book> list = bookService.selectBookInWeek(startDate);
        model.addAttribute("booklist",list);
        return "bookList";
    }

    /*
    **  查询热评书
    */
    @RequestMapping("/selectHotBook")
    public String selectHotBook(Model model){
        List<Book> list = bookService.showHotBook();
        model.addAttribute("booklist",list);
        return "bookList";
    }

    /**
     * 查找要修改的书
     */
    @RequestMapping("/selectBookById")
    public String selectBookById(int bookId,Model model){
       Book book = bookService.selectBookByBookId(bookId);
        model.addAttribute("book",book);
        return "updateBook";
    }

    /**
     * 更新书籍信息
     */
    @RequestMapping("/updateBook")
    public String updateBook(HttpServletRequest request,Book book,Model model,MultipartFile pic){

        System.out.print("========"+book.toString());

        if(!pic.isEmpty()){
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
        }


        System.out.print("========"+book.toString());
        boolean result = bookService.updateBook(book);
        if(result){
            model.addAttribute("msg","更新成功");
            return "redirect:../book/selectAllBook";
        }else{
            model.addAttribute("msg","更新失败");
            return "redirect:../book/selectAllBook";
        }

    }

    @RequestMapping("/selectBookForMain")
    public String selectBookForMain(HttpServletRequest request,Model model){
        Date startDate = DateUntils.startOfWeek();
        List<Book> newbook = bookService.selectBookInWeek(startDate);
        model.addAttribute("newbook",newbook);
        List<Book> hotBook = bookService.showHotBook();
        model.addAttribute("hotbook",hotBook);
        User user = (User)request.getSession().getAttribute("user");
        if (user.getType() == 2){
            return "managerMain";
        }else {
            return "main";
        }

    }




}
