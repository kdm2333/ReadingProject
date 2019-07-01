package edu.nuc.service;

import edu.nuc.entity.Book;
import edu.nuc.entity.BookExample;
import edu.nuc.untils.BookSearch;

import java.util.Date;
import java.util.List;

/**
 * Created by 57180 on 2019/5/17.
 */
public interface BookService {

    //查询所有书籍
    public List<Book> selectAllBook();

    public Book selectBookByBookId(int bookId);

    //查询
    public List<Book> selectBookListByExample(BookExample bookExample);

    //根据分类查询外国文学之类的
    public List<Book> selectBookListByBookType(int bookType);

    //根据status查询  无效的
    public List<Book> selectBookListByStatus(int status);

    public List<Book> selectBookListByBookName(String bookName);

    public List<Book> selectBookListByAuthor(String author);


    //添加书籍
    public boolean insertBook(Book book);

    //修改书籍
    public boolean updateBook(Book book);

    //查询本周新增
    public List<Book> selectBookInWeek(Date date);

    public List<Book> showHotBook();

    public List<Book> selectBookBySearch(BookSearch bookSearch);



}
