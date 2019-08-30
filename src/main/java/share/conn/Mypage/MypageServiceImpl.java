package share.conn.Mypage;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Resource(name="mypageDAO")
	private MypageDAO mypageDAO;

	@Override
	public Map<String, Object> userCheckPw(Map<String, Object> map) throws Exception {
		return mypageDAO.userCheckPw(map);
	}
	
	@Override
	public Map<String, Object> userDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.userDetail(map);
	}
	
	@Override
	public void userInfoUpdate(Map<String, Object> map) throws Exception{
		mypageDAO.userInfoUpdate(map);
	}
	
	@Override
	public void userPwUpdate(Map<String, Object> map) throws Exception{
		mypageDAO.userPwUpdate(map);
	}
	
	@Override
	public void userSecession(Map<String, Object> map) throws Exception {
		mypageDAO.userSecession(map);
	}
}
