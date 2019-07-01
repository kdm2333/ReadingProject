package edu.nuc.controller;/**
 * Created by 57180 on 2019/5/18.
 */

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.nuc.dao.CommentVoDao;
import edu.nuc.entity.Book;
import edu.nuc.entity.CommentVO;
import edu.nuc.entity.User;
import edu.nuc.entity.Usercomment;
import edu.nuc.service.BookService;
import edu.nuc.service.CommentVoService;
import edu.nuc.service.UserCommentService;
import edu.nuc.service.UserService;
import edu.nuc.untils.CommentSearch;
import edu.nuc.untils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("comment")
public class UserCommentController {

    @Autowired
    private UserCommentService userCommentService;

    @Autowired
    private BookService bookService;

    @Autowired
    private CommentVoService commentVoService;

    @Autowired
    private UserService userService;

    /*
    ** 查询老师的评论  按时间降序
    */



    @RequestMapping("/selectByUserId")
    public String selectByUserId(HttpServletRequest request,Model model,String userId){
        List<CommentVO> list = commentVoService.selectByUserId(userId);

        User user = userService.selectUserByUserId(userId);
        model.addAttribute("user",user);
        model.addAttribute("list",list);
        return "userComment";
    }


    @RequestMapping("/selectByUser")
    public String selectByUserId(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("user");
        List<CommentVO> list = commentVoService.selectByUserId(user.getUserid());
        model.addAttribute("username",list.get(0).getUsername());
        model.addAttribute("list",list);
        return "userComment";
    }



    @RequestMapping("/selectAllCommentByBook")
    public String selectAllComment(HttpServletRequest request,Model model){
        System.out.println("==============================");
        int bookId = Integer.parseInt(request.getParameter("bookid"));
        Book book = bookService.selectBookByBookId(bookId);
        model.addAttribute("book",book);

        List<CommentVO> list = commentVoService.selectTeacherByBookId(bookId);
        model.addAttribute("teacherComment",list);

        List<CommentVO> studentlist = commentVoService.selectStudentByBookId(bookId);
        model.addAttribute("studentComment",studentlist);
        return "commentList";
    }

    @RequestMapping("/selectTeacherComment")
    public String selectTeacherComment(Model model){
        List<CommentVO> list = commentVoService.selectTeacherComment();
        model.addAttribute("userComment",list);
        model.addAttribute("type",2);
        return "userTypeCommentList";
    }

    /*
   ** 查询学生的评论   按时间降序
   */
    @RequestMapping("/selectStudentComment")
    public String selectStudentComment(Model model){
        List<CommentVO> list = commentVoService.selectStudentComment();
        model.addAttribute("userComment",list);
        model.addAttribute("type",1);
        return "userTypeCommentList";
    }

    /*
    **  插入评论
    */

    @RequestMapping("/toInsertComment")
    public String toInsertComment(int bookid,Model model){
        Book book = bookService.selectBookByBookId(bookid);
        model.addAttribute("book",book);
        return "insertComment";
    }

    @RequestMapping("/insertComment")
    public String insertComment(HttpServletRequest request,Usercomment usercomment,Model model){
        User user = (User) request.getSession().getAttribute("user");
        usercomment.setCreatetime(new Date());
        usercomment.setUserid(user.getUserid());
        usercomment.setUsertype(user.getType());

        Book book = bookService.selectBookByBookId(usercomment.getBookid());
        model.addAttribute("bookid",usercomment.getBookid());
        System.out.print("++++++++++++++++++++"+usercomment.getTopic()+"++++++++++++++++++++");
        if (null != usercomment.getTopic()&&!"".equals(usercomment.getTopic())){
            boolean flag = userCommentService.insertComment(usercomment);
            if(flag){
                int count = book.getCommentno()+1;
                book.setCommentno(count);
                bookService.updateBook(book);
                model.addAttribute("msg","添加成功");
            }else{
                model.addAttribute("msg","添加失败");
            }
            return "redirect:/comment/selectAllCommentByBook";
        }else {
            model.addAttribute("msg","标题不能为空，请重新输入！");

            return "redirect:/comment/toInsertComment";
        }

    }

    /*
    ** 查看我的评论
    */
    @RequestMapping("/selectMyComment")
    public String selectComment(String userId,int status,Model model){
        if(status==0){
            List<Usercomment> list = userCommentService.selectMyComment(userId,Constant.INVALID);

        }
        List<Usercomment> list = userCommentService.selectMyComment(userId,Constant.VALID);
        model.addAttribute("commentList",list);
        return  "myComment";

    }

    /*
    **  删除我的评论
    */
    @RequestMapping("/updateComment")
    public String updateComment(HttpServletRequest request,int status ,int commentid, Model model){
        Usercomment usercomment = new Usercomment();
        usercomment.setStatus(status);
        usercomment.setCommentid(commentid);
        boolean flag = userCommentService.updateComment(usercomment);
        if(flag){
           model.addAttribute("msg","成功");
        }else{
            model.addAttribute("msg","失败");
        }
        return "redirect:/comment/selectCommentBySearch";
    }

    @RequestMapping("/selectCommentBySearch")
    public String selectCommentBySearch(Model model, CommentSearch search){
        if (search == null){
            search = new CommentSearch();
        }
        PageHelper.startPage(search.getPageNum(),search.getPageSize());
        List<CommentVO> list = commentVoService.selectByCommentSearch(search);
        PageInfo<CommentVO> pageInfo = new PageInfo<CommentVO>(list);

        model.addAttribute("page",pageInfo);
        model.addAttribute("search",search);

        System.out.print("==========="+search.toString());
        return "commentBySearch";
    }



}
