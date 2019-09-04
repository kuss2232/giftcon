package share.conn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import share.conn.giftcon.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{
	
	public List<Map<String, Object>> outData() throws Exception{
		return selectList("admin.outputData");
	}
}
