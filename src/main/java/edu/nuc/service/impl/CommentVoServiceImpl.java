package edu.nuc.service.impl;

import edu.nuc.dao.CommentVoDao;
import edu.nuc.entity.CommentVO;
import edu.nuc.service.CommentVoService;
import edu.nuc.untils.CommentSearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 裴佳琦
 * @CreateDate: 2019/5/22 18:02
 * @Description:
 */
@Service
public class CommentVoServiceImpl implements CommentVoService {

    @Autowired
    private CommentVoDao commentVoDao;

    @Override
    public List<CommentVO> selectTeacherByBookId(Integer bookId) {

        List<CommentVO> list = commentVoDao.selectTeacherByBookId(bookId);
        return list;


    }

    @Override
    public List<CommentVO> selectStudentByBookId(Integer bookId) {
        List<CommentVO> list = commentVoDao.selectStudentByBookId(bookId);
        return list;
    }

    @Override
    public List<CommentVO> selectByUserId(String userId){
        List<CommentVO> list = commentVoDao.selectByUserId(userId);
        return list;
    }

    @Override
    public List<CommentVO> selectTeacherComment() {
        List<CommentVO> list = commentVoDao.selectTeacherComment();
        return list;
    }

    @Override
    public List<CommentVO> selectStudentComment() {
        List<CommentVO> list = commentVoDao.selectStudentComment();
        return list;
    }

    @Override
    public List<CommentVO> selectByCommentSearch(CommentSearch search) {
        List<CommentVO> list = commentVoDao.selectByCommentSearch(search);
        return list;
    }
}
