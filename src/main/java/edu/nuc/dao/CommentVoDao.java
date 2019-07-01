package edu.nuc.dao;

import edu.nuc.entity.CommentVO;
import edu.nuc.untils.CommentSearch;

import java.util.List;

/**
 * @Author: 裴佳琦
 * @CreateDate: 2019/5/22 17:58
 * @Description:
 */
public interface CommentVoDao {

    List<CommentVO> selectTeacherByBookId (Integer bookId);

    List<CommentVO> selectStudentByBookId (Integer bookId);

    List<CommentVO> selectByUserId (String userId);

    List<CommentVO> selectTeacherComment();

    List<CommentVO> selectStudentComment();

    List<CommentVO> selectByCommentSearch(CommentSearch search);
}
