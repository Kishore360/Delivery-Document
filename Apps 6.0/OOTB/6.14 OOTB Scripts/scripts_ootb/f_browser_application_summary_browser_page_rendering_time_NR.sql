SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.page_rendering_time' ELSE 'SUCCESS' END as Message
    from 
    (select SRC.sourceinstance, round(avg(SRC.pagerenderingduration),5) pg_du, CONCAT( COALESCE((DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y%m%d%H%i')),'UNSPECIFIED'),
	 '~', COALESCE(FLOOR(SRC.appId),'UNSPECIFIED'), '~', COALESCE(CONCAT (SRC.city,', ',SRC.regionCode,', ',
	 SRC.countryCode),'UNSPECIFIED'),'~', COALESCE(SRC.name,'UNSPECIFIED'),'~', COALESCE(CONCAT(SRC.userAgentName,
	 '~',SRC.userAgentVersion,'~',SRC.userAgentOS,'~',SRC.deviceType),'UNSPECIFIED'),'~', 
	 COALESCE(SRC.session,'UNSPECIFIED')) sys_id from #MDS_TABLE_SCHEMA.PageView_final SRC
    group by  CONCAT( COALESCE((DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y%m%d%H%i')),'UNSPECIFIED'),
	 '~', COALESCE(FLOOR(SRC.appId),'UNSPECIFIED'), '~', COALESCE(CONCAT (SRC.city,', ',SRC.regionCode,', ',
	 SRC.countryCode),'UNSPECIFIED'),'~', COALESCE(SRC.name,'UNSPECIFIED'),'~', COALESCE(CONCAT(SRC.userAgentName,
	 '~',SRC.userAgentVersion,'~',SRC.userAgentOS,'~',SRC.deviceType),'UNSPECIFIED'),'~', 
	 COALESCE(SRC.session,'UNSPECIFIED')), SRC.sourceinstance) t 
    LEFT JOIN #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
	 ON t.sys_id  =TRGT.row_id  
	 AND t.sourceinstance=TRGT.source_id 
 where coalesce( t.pg_du ,'')<> COALESCE(round(TRGT.page_rendering_time,5),'');