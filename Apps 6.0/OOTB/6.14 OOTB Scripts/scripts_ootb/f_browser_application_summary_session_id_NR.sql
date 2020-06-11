SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.session_id' ELSE 'SUCCESS' END as Message
    from #MDS_TABLE_SCHEMA.PageView_final SRC 
    	 LEFT JOIN #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
	 ON (CONCAT( COALESCE((DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y%m%d%H%i')),'UNSPECIFIED'),
	 '~', COALESCE(FLOOR(SRC.appId),'UNSPECIFIED'), '~', COALESCE(CONCAT (SRC.city,', ',SRC.regionCode,', ',
	 SRC.countryCode),'UNSPECIFIED'),'~', COALESCE(SRC.name,'UNSPECIFIED'),'~', COALESCE(CONCAT(SRC.userAgentName,
	 '~',SRC.userAgentVersion,'~',SRC.userAgentOS,'~',SRC.deviceType),'UNSPECIFIED'),'~', 
	 COALESCE(SRC.session,'UNSPECIFIED') )  =TRGT.row_id  
	 AND SRC.sourceinstance=TRGT.source_id ) 
     left join #MDS_TABLE_SCHEMA.applications_final app
     on (app.id = SRC.appId and SRC.sourceinstance = app.sourceinstance)
     left join #MDS_TABLE_SCHEMA.key_transactions_final keyt
     on substr( substr(SRC.name, instr(SRC.name,'/')),
                instr( substr(SRC.name, instr(SRC.name,'/')+ 1), '/')+1 ) = keyt.transactionname 
                AND SRC.appId = keyt.applicationid    
 where coalesce( SRC.session ,'')<>  COALESCE(TRGT.session_id,'');
 
 