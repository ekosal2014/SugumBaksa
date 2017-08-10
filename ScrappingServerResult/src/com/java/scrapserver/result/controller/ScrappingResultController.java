package com.java.scrapserver.result.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.scrapserver.result.model.Status;
import com.java.scrapserver.result.model.SugumBaksa;
import com.java.scrapserver.result.service.ScrappingServerSerice;

@Controller
public class ScrappingResultController {

	final static Logger log = Logger.getLogger(ScrappingResultController.class);
	/**
     * Size of a byte buffer to read/write file
     */
    private static final int BUFFER_SIZE = 4096;
             
    /**
     * Path of the file to be downloaded, relative to application's directory
     */
	private String filePath = "/static/files/스크래핑결과.xlsx";
	
	@Autowired
	private ScrappingServerSerice scrappingServerSerice;
	
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String sugumBaksaPage(){
		return "index";
	}
	
	/***************************************************
	 * View Page import Data Information From Excel into View
	 * @return
	 */
	@RequestMapping(value ="/import", method = RequestMethod.GET)
	public String importPage(){
		return "import";
	}
	/***************************************************
	 * View Page import Data Information From Excel into View
	 * @return
	 */
	@RequestMapping(value ="/error", method = RequestMethod.GET)
	public String errortPage(){
		return "error";
	}
	/***************************************************
	 * View Page Export Data Information From View into Excel
	 * @return
	 */
	@RequestMapping(value ="/export", method = RequestMethod.POST)
	public String exportPage(@RequestParam("chdl-dt") String date,HttpServletRequest request){
		request.setAttribute("infoList", scrappingServerSerice.selectScrappingInformation(date.replace("-", "")));
		return "exports";
	}
	
	/***************************************************
	 * Upload File Excel And Loading Data From Excel to View Page
	 * @param file
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value ="/listDataOnView", method = RequestMethod.POST)
	public String abcPage(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		if (file != null){
			try{
				File imageFile = new File(request.getServletContext().getRealPath("/static/files"),file.getOriginalFilename());
				System.out.println(request.getServletContext().getRealPath("/static/files"));
				file.transferTo(imageFile);							
			}catch(Exception e){
				e.printStackTrace();
				
			}
		
		}
		request.setAttribute("parth", request.getServletContext().getRealPath("/static/files/")+file.getOriginalFilename());
		return "import";
	}
	
	/************************************************
	 * Insert Scrapping Information into database
	 * Return 	 * 
	 */
	@RequestMapping(value = "/insertScrapInformation", method = RequestMethod.POST)
	 public @ResponseBody Status insertScrapingServerInformation(@RequestBody ArrayList<SugumBaksa> info){
		//scrappingServerSerice.insertScrapingServerInformation(info);		
		return scrappingServerSerice.insertScrapingServerInformations(info);
	}
	
	/***********************************************
	 * Select scraping information by Date
	 * Return List Information
	 */
	@RequestMapping(value = "/selectScrapingInformation", method = RequestMethod.GET)
	public @ResponseBody List<SugumBaksa> selectScrapingInformation(@RequestParam("date") String date){
		System.out.println("Data Result ============== " + date);
		return scrappingServerSerice.selectScrappingInformation(date);
	}
	/***********************************************
	 * Export Simple Excel
	 * Return List Information
	 * @throws IOException 
	 */
	@RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
	public void exportSimpleExcel(HttpServletRequest request,HttpServletResponse response) throws IOException{
		// get absolute path of the application
		
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");
        System.out.println("appPath = " + appPath);
 
        // construct the complete absolute path of the file
        String fullPath = appPath + filePath;      
        File downloadFile = new File(fullPath);
        FileInputStream inputStream = new FileInputStream(downloadFile);
         
        // get MIME type of the file
        String mimeType = context.getMimeType(fullPath);
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/ms-excel; charset=UTF-8";
        }
        System.out.println("MIME type: " + mimeType);
 
        // set content attributes for the response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
 
        // set headers for the response
        response.setCharacterEncoding("UTF-8");
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"",URLEncoder.encode(downloadFile.getName(), "UTF-8"));
        response.setHeader(headerKey, headerValue);
 
        // get output stream of the response
        OutputStream outStream = response.getOutputStream();
 
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = -1;
 
        // write bytes read from the input stream into the output stream
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
 
        inputStream.close();
        outStream.close();
	}
}
