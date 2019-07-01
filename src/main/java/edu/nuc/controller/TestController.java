package edu.nuc.controller;/**
 * Created by 57180 on 2019/4/16.
 */

import edu.nuc.entity.Book;
import edu.nuc.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * @program: ReadingProject
 * @description:
 * @author: 李柏君
 * @create: 2019-04-16 10:55
 **/
@Controller
@RequestMapping("test")
public class TestController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/test")
    public String test(Model model){

        return "AupLoad";
    }

    @RequestMapping("/upload")
    public String upload(HttpServletRequest request,Book book, MultipartFile pic){
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
        bookService.insertBook(book);
        return "Auploadtest";
    }

}
