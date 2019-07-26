package share.conn.adminNotify;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

 @Service("adminNotifyService")
public class AdminNotifyServiceImpl implements AdminNotifyService {
	 
	 
	 
 
	
	@Resource(name = "adminNotifyDAO")
	private AdminNotifyDAO adminNotifyDAO;

}
 
 