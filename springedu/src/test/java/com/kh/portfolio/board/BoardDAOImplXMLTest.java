
package com.kh.portfolio.board;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.board.dao.BoardDAO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.common.RecordCriteria;

@ExtendWith(SpringExtension.class)

@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardDAOImplXMLTest {
	private final static Logger logger = LoggerFactory.getLogger(BoardDAOImplXMLTest.class);

	@Inject
	BoardDAO boardDAO;

//	@Inject
	/* RecordCriteria recordCriteria = new RecordCriteria(); */



	// 게시글 목록(페이지, 검색어 추가)

	@Test
	@Named("게시글목록(페이징)")
	public void list3() {

		int reqPage = 1;

		RecordCriteria recordCriteria = new RecordCriteria(reqPage);
		recordCriteria.setReqPage(reqPage);
		logger.info("" + recordCriteria.getStartRec());
		logger.info("" + recordCriteria.getEndRec());
	
//		List<BoardVO> list = boardDAO.list("NOTICE" , recordCriteria.getStartRec(), recordCriteria.getEndRec(), "TC", "ㄹㄹ");
		List<BoardVO> list = boardDAO.list("NOTICE" , recordCriteria.getStartRec(), recordCriteria.getEndRec(), "A", "ㄹㄹ");
		logger.info("검색결과:" + list.size());
		for (BoardVO boardVO : list) {
			logger.info(boardVO.toString());
		}
	}
}
