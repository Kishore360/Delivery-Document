SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.satisfied_transaction_count' ELSE 'SUCCESS' END as Message
	
   -- select t.avg_du, TRGT.satisfied_transaction_count
    from
(select SRC.sourceinstance,SUM(CASE WHEN SRC.duration > app.enduserapdexthreshold AND SRC.duration <= 4*app.enduserapdexthreshold 
THEN 1 ELSE 0 END)  avg_du, SRC.sys_id from app_test.transaction_nr SRC
     LEFT OUTER JOIN
					#MDS_TABLE_SCHEMA.applications_final app 
                    ON SRC.appId = app.id 
                    AND SRC.sourceinstance = app.sourceinstance  
    group by  SRC.sys_id, SRC.sourceinstance) t      	
	 LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
	 ON t.sys_id  =TRGT.row_id  
	 AND t.sourceinstance=TRGT.source_id 
 where coalesce( t.avg_du ,'')<> COALESCE(TRGT.satisfied_transaction_count,'');