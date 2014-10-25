package com.admin.server;

import java.util.List;

import com.boyi.base.BaseServer;
import com.boyi.po.Paper;

public interface PaperService extends BaseServer<Paper>{
	public List<Paper> findAllByGradeAndSubject(String grade, String subject);
	public Paper getPaper(Paper paper);
}
