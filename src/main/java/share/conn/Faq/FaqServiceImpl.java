package share.conn.Faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	
	@Resource(name="faqDAO")
	private FaqDAO faqDAO;

	@Override
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception {
		return faqDAO.faqList(map);
	}

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> map) throws Exception {
		return faqDAO.searchTitleList(map);
	}

	@Override
	public List<Map<String, Object>> faqCategoryList(String category) throws Exception {
		return faqDAO.faqCategoryList(category);
	}

}
