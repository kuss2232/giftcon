package share.conn.Kakao;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import share.conn.giftcon.CommandMap;
 
 
@Controller
public class KakaoController {
    
	
	private String tid = "";
    
    
	private static KakaoRestApiHelper apiHelper = new KakaoRestApiHelper();
	
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	@ModelAttribute("sharecon")
	private Map<String, Object> map() {
		return new HashMap<String, Object>();
	}
	
    @RequestMapping(value = "/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @RequestMapping(value = "/kakaos") 
    public void kakaos(@ModelAttribute("sharecon") Map<String, Object> map, CommandMap commandMap, HttpServletResponse response) throws IOException {
        //
    	PrintWriter out = response.getWriter();
        Map<String, String> paramMap = new HashMap<String, String>();
        List sty = new List();

        paramMap.put("cid", "TC0ONETIME");
        paramMap.put("partner_order_id", "1234");
        paramMap.put("partner_user_id", "sharecon");
        paramMap.put("item_name", commandMap.get("item_name").toString());//상품이름
        paramMap.put("quantity", commandMap.get("quantity").toString());//상품수량
        paramMap.put("total_amount", commandMap.get("total_amount").toString());//총 수량
        paramMap.put("vat_amount", String.valueOf(((int)Integer.parseInt(commandMap.get("total_amount").toString())/10)));
        paramMap.put("tax_free_amount", commandMap.get("tax_free_amount").toString());//세금 0 원
        paramMap.put("approval_url", "http://localhost:8080/giftcon/kakaoPaySuccess.conn");//결제완료시
        paramMap.put("fail_url", "http://localhost:8080/giftcon/kakaoPayCancel.conn");//결제 실패시
        paramMap.put("cancel_url", "http://localhost:8080/giftcon/kakaoPayCancel.conn");//결제 취소시
        
        String str = apiHelper.readyPay(paramMap);
        out.print(str);
        tid(str);
		 
    }
    
    private void tid(String str) {
    	tid = str.split("\"")[3];//4번쨰 고유번호를 보여줌
    }
    
	
	/*
	 * private KakaoPayApprovalVO kakaoPayInfo(String pg_token) { Map<String,
	 * String> paramMap = new HashMap<String, String>();
	 * 
	 * paramMap.put("cid", "TC0ONETIME"); paramMap.put("tid", tid);
	 * paramMap.put("partner_order_id", "1001"); paramMap.put("partner_user_id",
	 * "gorany"); paramMap.put("pg_token", pg_token); paramMap.put("total_amount",
	 * "2100");
	 * 
	 * Object ad = apiHelper.successPay(paramMap);
	 * 
	 * return (kakaoPayApprovalVO) ad; }
	 */
	  
    @RequestMapping(value = "/kakaoPaySuccess")
    public ModelAndView kakaoPaySuccess() {
        //System.out.println("kakaoPaySuccess get............................................");
        //System.out.println("kakaoPaySuccess pg_token : " + pg_token);
    	ModelAndView mv = new ModelAndView("/order/success");
        return mv;
    }
    
}