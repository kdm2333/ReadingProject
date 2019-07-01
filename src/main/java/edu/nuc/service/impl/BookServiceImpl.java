package edu.nuc.service.impl;/**
 * Created by 57180 on 2019/5/17.
 */

import edu.nuc.dao.BookMapper;
import edu.nuc.entity.Book;
import edu.nuc.entity.BookExample;
import edu.nuc.service.BookService;
import edu.nuc.untils.BookSearch;
import edu.nuc.untils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    //查询所有有效书
    public List<Book> selectAllBook() {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }

    @Override
    public Book selectBookByBookId(int bookId){
        if(bookId == 0){
            throw new NullPointerException();
        }
        Book book = bookMapper.selectByPrimaryKey(bookId);
        //测试bookId不正确时是否会报空指针
        return book;
    }


    @Override
    public List<Book> selectBookListByExample(BookExample bookExample) {
        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }

    @Override
    /**
    * 按类型查询
    */
    public List<Book> selectBookListByBookType(int bookType) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBooktypeEqualTo(bookType).andStatusEqualTo(Constant.VALID);
        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }

    /**
     * 根据图书状态查询书籍
     */
    @Override
    public List<Book> selectBookListByStatus(int status) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andStatusEqualTo(status);

        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }


    /**
     * *  按书名模糊查询
     */
    @Override
    public List<Book> selectBookListByBookName(String bookName) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBooknameLike("%"+bookName+"%").andStatusEqualTo(Constant.VALID);

        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }

    @Override
    /*
    ** 按作者模糊查询
    */
    public List<Book> selectBookListByAuthor(String author) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andAuthorLike("%"+author+"%").andStatusEqualTo(Constant.VALID);

        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }

    /*
    ** 查询本周新增
    */
    public List<Book> selectBookInWeek(Date date){
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andCreatetimeGreaterThanOrEqualTo(date).andStatusEqualTo(Constant.VALID);
        List<Book> list = bookMapper.selectByExample(bookExample);
        return  list;
    }


    @Override
    public boolean insertBook(Book book) {
        book.setStatus(Constant.VALID);
        book.setCreatetime(new Date());
        book.setCommentno(0);
        int i = bookMapper.insert(book);
        if(i>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateBook(Book book) {
        int i = bookMapper.updateByPrimaryKeySelective(book);
        if(i>0){
            return true;
        }else {
            return false;
        }
    }
    /**
     * 显示热评书籍
     */
    @Override
    public List<Book> showHotBook(){
        BookExample bookExample = new BookExample();
        bookExample.setOrderByClause("commentno DESC");
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andStatusEqualTo(Constant.VALID);
        List<Book> list  = bookMapper.selectByExample(bookExample);
        return  list;
    }

    @Override
    public List<Book> selectBookBySearch(BookSearch bookSearch) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();

        if(bookSearch.getAuthor()!=null&&!bookSearch.getAuthor().equals("")){
            criteria.andAuthorLike("%"+bookSearch.getAuthor()+"%");
        }
        if (bookSearch.getBookname()!=null&&!bookSearch.getBookname().equals("")){
            criteria.andBooknameLike("%"+bookSearch.getBookname()+"%");
        }
        if (bookSearch.getPress()!=null&&!bookSearch.getPress().equals("")){
            criteria.andPressLike("%"+bookSearch.getPress()+"%");
        }
        if (bookSearch.getCreatetime()!=null&&!bookSearch.getCreatetime().equals("")){
            //没有写出来
        }
        if (bookSearch.getBooktype()!=null&&!bookSearch.getBooktype().equals("")&&bookSearch.getBooktype()!=0){
            criteria.andBooktypeEqualTo(bookSearch.getBooktype());
        }
        if (bookSearch.getStatus()!=null&&!bookSearch.getStatus().equals("")&&bookSearch.getStatus()!=0){
            criteria.andStatusEqualTo(bookSearch.getStatus());
        }

        List<Book> list = bookMapper.selectByExample(bookExample);
        return list;
    }
}
