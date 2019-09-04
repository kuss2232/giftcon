package share.conn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;
	
	public List<Map<String, Object>> outData() throws Exception{
		return adminDAO.outData();
	}
}
