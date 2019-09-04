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
		List<Map<String, Object>> outData = adminService.outData();
		BufferedWriter bw = null;
		ModelAndView mv = new ModelAndView("/admin/adminMain");
		try {
			File ex = new File("C://data1");
			if(!ex.exists()) {
				ex.mkdirs();
			}
			
			bw = Files.newBufferedWriter(Paths.get("C://data1//data.csv"), Charset.forName("UTF-8"));
			bw.write("BC,GOODS_NAME,DAY_CHECK,GENDER,SC,AGE");
			bw.newLine();
			int cnt =0;
			for(Map<String, Object> data1 : outData) {
				for(Object value : data1.values()) {
					bw.write(value+"");
					cnt++;
					if(cnt == 6) {
					bw.newLine();
					cnt=0;
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
