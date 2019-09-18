package share.conn.home;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.rcaller.rStuff.RCaller;

import share.conn.giftcon.CommandMap;

@Controller
public class Home {
	@RequestMapping("/chart.conn")
	public ModelAndView chart(HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("WEB-INF/jsp");
		ModelAndView mv = new ModelAndView();
		RConnection connection = null;
		mv.setViewName("aaa");
		
		
		try {
			connection = new RConnection();
			
			 connection.eval("library(devtools)"); 
			 //connection.eval("library(graphics)"); 
			 connection.eval("library(RCurl)");
			 connection.eval("library(d3Network)");
			 connection.eval("library(png)");
			 
			 connection.eval("png(file = \"D:/java/R/word232.png\", width=5, height=5, units=\"in\", res=300, )");
			 
            connection.close();
            
            BufferedReader reader = new BufferedReader(new FileReader("D:\\Rstudio\\q\\aaa.jsp"));
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + "/aaa.jsp"),"UTF-8"));
            String s;
            String str = "<%@page contentType=\"text/html; charset=UTF-8\"%>";
            writer.write(str);
            while ((s = reader.readLine()) != null) {
            	writer.write(s);
            	writer.newLine();
            }
            FileCopyUtils.copy(reader, writer);
            mv.addObject("viewPage","aaa.jsp");
		}catch(Exception e) {
			System.out.println(e);
		}
		return mv;
	}
}
