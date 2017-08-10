package com.java.scrapserver.result.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.scrapserver.result.mapper.ScrappingServerMapper;
import com.java.scrapserver.result.model.Status;
import com.java.scrapserver.result.model.SugumBaksa;

@Service
public class ScrappingServerSerice {
	
	@Autowired
	private ScrappingServerMapper scrappingServerMapper;
	/********************************************************
	 * Import scrapping server information to db
	 * Return ........
	 */
	public void insertScrapingServerInformation(ArrayList<SugumBaksa>  sugumBaksa){
		try{
			for (int i=0;i<sugumBaksa.size();i++){
				SugumBaksa baksa = (SugumBaksa) sugumBaksa.get(i);
				/*baksa.setDateReport(baksa.getDateReport().replaceAll("-", ""));*/
				scrappingServerMapper.insertScrapingServerInformation(baksa);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	/********************************************************
	 * Import scrapping server information to db
	 * Return ........
	 */
	public Status insertScrapingServerInformations(ArrayList<SugumBaksa>  sugumBaksas){
		Status status = new Status();
		try{	
			if (checkDuplatedKey(sugumBaksas.get(0).getDateReport()) > 0){
				status.setCode("8888");
				status.setStatus("Import Information is Duplicated!");
				return status;
			}
			scrappingServerMapper.insertScrapingServerInformations(sugumBaksas);
			status.setCode("0000");
			status.setStatus("Import Information is Completed!");
			
		}catch(Exception e){
			e.printStackTrace();
			status.setCode("9999");
			status.setStatus("Import Information is Fail!");
		}
		return status;
	}
	/*******************************************************
	 * Retrieve Information Scraping 
	 * Return List Information
	 */
	public List<SugumBaksa> selectScrappingInformation(String date){
		List<SugumBaksa> scrapingList = new ArrayList<SugumBaksa>();
		try{
			scrapingList = scrappingServerMapper.selectScrappingInformation(date);
		}catch(Exception e){
			e.printStackTrace();
		}
		return scrapingList;
	}
	
	public int checkDuplatedKey(String date){
		int status = 0;
		try{
			status = scrappingServerMapper.checkDuplatedKey(date);
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
}
