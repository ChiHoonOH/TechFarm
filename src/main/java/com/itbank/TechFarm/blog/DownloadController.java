package com.itbank.TechFarm.blog;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController implements ApplicationContextAware{
	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);
	private WebApplicationContext context = null;

	@RequestMapping(value="/fileDownload")
    public ModelAndView download(@RequestParam("upPath")String path,@RequestParam("file1")String fileName){
         
        String fullPath = path + "\\" + fileName;
        File file = new File(fullPath);
         
        return new ModelAndView("download", "downloadFile", file);
    }

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// TODO Auto-generated method stub
		
		this.context = (WebApplicationContext)arg0;
	}

}
