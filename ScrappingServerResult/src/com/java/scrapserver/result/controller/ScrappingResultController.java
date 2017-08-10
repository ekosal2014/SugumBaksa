package com.java.scrapserver.result.controller;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
}
