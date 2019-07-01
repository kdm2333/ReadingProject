package edu.nuc.dao;

import edu.nuc.entity.Usercomment;
import edu.nuc.entity.UsercommentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsercommentMapper {
    int countByExample(UsercommentExample example);

    int deleteByExample(UsercommentExample example);

    int deleteByPrimaryKey(Integer commentid);

    int insert(Usercomment record);

    int insertSelective(Usercomment record);

    List<Usercomment> selectByExampleWithBLOBs(UsercommentExample example);

    List<Usercomment> selectByExample(UsercommentExample example);

    Usercomment selectByPrimaryKey(Integer commentid);

    int updateByExampleSelective(@Param("record") Usercomment record, @Param("example") UsercommentExample example);

    int updateByExampleWithBLOBs(@Param("record") Usercomment record, @Param("example") UsercommentExample example);

    int updateByExample(@Param("record") Usercomment record, @Param("example") UsercommentExample example);

    int updateByPrimaryKeySelective(Usercomment record);

    int updateByPrimaryKeyWithBLOBs(Usercomment record);

    int updateByPrimaryKey(Usercomment record);
}