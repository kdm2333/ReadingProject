package edu.nuc.service;

import edu.nuc.entity.CommentVO;
import edu.nuc.untils.CommentSearch;

import java.util.List;

public interface CommentVoService {

    List<CommentVO> selectTeacherByBookId(Integer bookId);

    List<CommentVO> selectStudentByBookId(Integer bookId);

    List<CommentVO> selectByUserId(String userId);

    List<CommentVO> selectTeacherComment();

    List<CommentVO> selectStudentComment();

    List<CommentVO> selectByCommentSearch(CommentSearch search);

}
