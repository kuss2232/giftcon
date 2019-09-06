package share.conn.admin;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@RequestMapping("/adminMain.conn")
	public ModelAndView adminMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/adminMain");
		return mv;
	}
	
	
	@RequestMapping("/adminOut.conn")
	public ModelAndView adminOut() throws Exception {
		List<Map<String, Object>> outData = adminService.outData();//List에 Map객체를 담아서 선언 map객체는 key value 로 이루어짐
		BufferedWriter bw = null;
		ModelAndView mv = new ModelAndView("/admin/adminMain");
		try {
			File ex = new File("C://data1");
			if(!ex.exists()) {//data1 파일이 존재하지않으면
				ex.mkdirs();//폴더생성
			}
			
			bw = Files.newBufferedWriter(Paths.get("C://data1//data.csv"), Charset.forName("UTF-8"));
			bw.write("BC,GOODS_NAME,DAY_CHECK,GENDER,SC,AGE");
			bw.newLine();//줄바꿈
			int cnt =0; //컬럼변수선언
			for(Map<String, Object> data1 : outData) {//outData가 Map 객체로 만들어진 data1에 map객체 하나씩넣어서 보낸다
				for(Object value : data1.values()) {//map객체에 value 값만 넣어서 value에 보내준다
					bw.write(value+""); //value값을 ""로 감싸서 출력
					cnt++; // 하나씩증감
					if(cnt == 6) { // 컬럼이 6줄되면 다음칸으로 넘어감
					bw.newLine(); // 줄바꿈시켜줌
					cnt=0; // 줄바꾼뒤 초기화
					}else {
						bw.write(",");
					}
				}
			}
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(bw != null) {
					bw.close();
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}

}
