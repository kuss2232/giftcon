package share.conn.Login;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDAO")
	 private LoginDAO loginDAO;
	
	@Override
	public Map<String, Object> loginGo(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}
	
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception{
		return loginDAO.findId(map);
	}
	
	@Override
	public Map<String, Object> findPwd(Map<String, Object> map) throws Exception{
		return loginDAO.findPwd(map);
	}

	@Override
	public void chgPw(Map<String, Object> map) throws Exception{
		loginDAO.chgPw(map);
	}
	
	
}
