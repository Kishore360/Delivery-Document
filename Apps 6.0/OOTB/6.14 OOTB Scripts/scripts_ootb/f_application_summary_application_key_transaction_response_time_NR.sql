SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_browser_application_summary.application_key_transaction_response_time' ELSE 'SUCCESS' END as Message
	from 
    (select SRC.sourceinstance, round(AVG(CASE WHEN kt.id is NOT NULL THEN SRC.duration ELSE 0 END),5) avg_du, 
    SRC.sys_id from  app_test.transaction_nr SRC
    left join #MDS_TABLE_SCHEMA.key_transactions_final kt on
    substr( substr(SRC.name, instr(SRC.name,'/')), instr( substr(SRC.name,instr(SRC.name,'/')+ 1),'/')+1 )
    = kt.transactionname
    group by  SRC.sys_id, SRC.sourceinstance) t      	
	 LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
	 ON t.sys_id  =TRGT.row_id  
	 AND t.sourceinstance=TRGT.source_id 
 where coalesce( t.avg_du ,'')<> COALESCE(round(TRGT.application_key_transaction_response_time,5),'');
