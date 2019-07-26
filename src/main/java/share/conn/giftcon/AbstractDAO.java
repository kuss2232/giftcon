package share.conn.giftcon;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public Object insert(String queryId) {
		printQueryId(queryId);
		return sqlSession.insert(queryId);
	}
	

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId) {
		printQueryId(queryId);
		return sqlSession.update(queryId);
	}

	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId) {
		printQueryId(queryId);
		return sqlSession.delete(queryId);
	}


	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}

	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	

	// ������ ȸ�� ���̵� �˻�
	@SuppressWarnings("rawtypes")
	public List searchMemberList(String map, Object params) {
		printQueryId(map);
		return sqlSession.selectList(map, params);
	}
	
	// ������ ȸ�� ���̵� �ߺ� Ȯ��
	@SuppressWarnings("rawtypes")
	public String selectMemberId(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}


	// �̸� �˻�


	// ������ ȸ�� �̸� �˻�
	@SuppressWarnings("rawtypes")
	public List searchMemberName(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}


	// ȸ�����̵�� �˻�

	// ������ ȸ�� ��ȭ��ȣ �˻�


	// ȸ�����̵�� �˻�


	// ������ ȸ�� ��ȭ��ȣ �˻�

	@SuppressWarnings("rawtypes")
	public List searchMemberPhone(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}



	// E-Mail �˻�

	// ������ ȸ�� �̸��� �˻�



	// E-Mail �˻�
	// ������ ȸ�� �̸��� �˻�


	// ������ ȸ�� �̸��� �˻�

	@SuppressWarnings("rawtypes")
	public List searchMemberEmail(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	// ������ �˻�
	@SuppressWarnings("rawtypes")
	public List searchTitleList(String queryId, Object params, String isSearch) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}

	// �۳��� �˻�
	@SuppressWarnings("rawtypes")
	public List searchContentList(String queryId, Object params, String isSearch) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	// ����¡
	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params){
		printQueryId(queryId);
		Map<String, Object> map  = (Map<String, Object>)params;
		
		String strPageIndex = (String)map.get("PAGE_INDEX");
		String strPageRow = (String)map.get("PAGE_ROW");
		int nPageIndex = 0;
		int nPageRow = 20;
		
		if(StringUtils.isEmpty(strPageIndex) == false){
			nPageIndex = Integer.parseInt(strPageIndex)-1;
		}
		if(StringUtils.isEmpty(strPageRow) == false){
			nPageRow = Integer.parseInt(strPageRow);
		}
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		
		return sqlSession.selectList(queryId, map);
	}
	public Map<String, Object> selectOne1(String queryId, Object params) {
	      printQueryId(queryId);
	      return sqlSession.selectOne(queryId, params);
	   }
}

