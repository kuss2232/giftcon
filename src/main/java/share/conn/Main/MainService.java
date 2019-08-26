package share.conn.Main;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	public List<Map<String, Object>> GoodsBestList() throws Exception;
	
	public List<Map<String, Object>> GoodsSaleList1() throws Exception;
	
	public List<Map<String, Object>> eventList() throws Exception;

	public List<Map<String, Object>> endEventList() throws Exception;

	public Map<String, Object> eventDetail(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> goodsBudget(Map<String, Object> map) throws Exception;
	
}
