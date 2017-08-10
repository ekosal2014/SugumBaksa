package com.java.scrapserver.result.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.scrapserver.result.model.SugumBaksa;

public interface ScrappingServerMapper {
	/********************************************************
	 * Import scrapping server information to db
	 * 
	 */
	public void insertScrapingServerInformation(SugumBaksa sugumBaksa);
	/********************************************************
	 * Import scrapping server information to db Loop in Mybatis
	 * 
	 */
	public void insertScrapingServerInformations(ArrayList<SugumBaksa>  sugumBaksas);
	/*******************************************************
	 * Retrieve Information Scrapping 
	 * Return List Information
	 */
	public List<SugumBaksa> selectScrappingInformation(@Param("date") String date);
	
	/******************************************************
	 * 
	 */
    public int checkDuplatedKey(@Param("date") String date);
}
