SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.application_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.PageView_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_browser_application_summary TRGT 
 ON (CONCAT( COALESCE((DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y%m%d%H%i')),'UNSPECIFIED'),
 '~', COALESCE(FLOOR(SRC.appId),'UNSPECIFIED'), '~', COALESCE(CONCAT (SRC.city,', ',SRC.regionCode,', ',
 SRC.countryCode),'UNSPECIFIED'),'~', COALESCE(SRC.name,'UNSPECIFIED'),'~', COALESCE(CONCAT(SRC.userAgentName,
 '~',SRC.userAgentVersion,'~',SRC.userAgentOS,'~',SRC.deviceType),'UNSPECIFIED'),'~', 
 COALESCE(SRC.session,'UNSPECIFIED') )  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.d_application lov
 on lov.row_id = CONCAT('APPLICATION~',SRC.appid)
 and lov.source_id = SRC.sourceinstance
 WHERE COALESCE(lov.row_key,0)<> COALESCE(TRGT.application_key ,0); 