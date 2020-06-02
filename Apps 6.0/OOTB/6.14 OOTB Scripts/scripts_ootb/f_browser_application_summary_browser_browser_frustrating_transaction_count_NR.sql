SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.frustrating_transaction_count' ELSE 'SUCCESS' END as Message
      from 
    (select SRC.sourceinstance, SUM(CASE WHEN SRC.duration > ( 4*app.enduserapdexthreshold ) THEN 1 ELSE 0 END)du, CONCAT( COALESCE((DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y%m%d%H%i')),'UNSPECIFIED'),
	 '~', COALESCE(FLOOR(SRC.appId),'UNSPECIFIED'), '~', COALESCE(CONCAT (SRC.city,', ',SRC.regionCode,', ',
	 SRC.countryCode),'UNSPECIFIED'),'~', COALESCE(SRC.name,'UNSPECIFIED'),'~', COALESCE(CONCAT(SRC.userAgentName,
	 '~',SRC.userAgentVersion,'~',SRC.userAgentOS,'~',SRC.deviceType),'UNSPECIFIED'),'~', 
	 COALESCE(SRC.session,'UNSPECIFIED')) sys_id from #MDS_TABLE_SCHEMA.PageView_final SRC
    left join #MDS_TABLE_SCHEMA.applications_final app 
    on SRC.appId = app.id and SRC.sourceinstance = app.sourceinstance
    group by CONCAT( COALESCE((DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y%m%d%H%i')),'UNSPECIFIED'),
	 '~', COALESCE(FLOOR(SRC.appId),'UNSPECIFIED'), '~', COALESCE(CONCAT (SRC.city,', ',SRC.regionCode,', ',
	 SRC.countryCode),'UNSPECIFIED'),'~', COALESCE(SRC.name,'UNSPECIFIED'),'~', COALESCE(CONCAT(SRC.userAgentName,
	 '~',SRC.userAgentVersion,'~',SRC.userAgentOS,'~',SRC.deviceType),'UNSPECIFIED'),'~', 
	 COALESCE(SRC.session,'UNSPECIFIED')), SRC.sourceinstance) t 
    LEFT JOIN #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
	 ON t.sys_id  =TRGT.row_id  
	 AND t.sourceinstance=TRGT.source_id 
 where coalesce( t.du ,'')<> COALESCE(round(TRGT.frustrating_transaction_count,5),'');
 
