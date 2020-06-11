SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.errors_app_tier' ELSE 'SUCCESS' END as Message
	   from 
    (select SRC.sourceinstance,sum( ( CASE WHEN SRC.error=TRUE THEN 1 ELSE 0 END)) avg_du, SRC.sys_id from  app_test.transaction_nr SRC
    group by  SRC.sys_id, SRC.sourceinstance) t      	
	 LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
	 ON t.sys_id  =TRGT.row_id  
	 AND t.sourceinstance=TRGT.source_id 
 where coalesce( t.avg_du ,'')<> COALESCE(TRGT.errors_app_tier,'');