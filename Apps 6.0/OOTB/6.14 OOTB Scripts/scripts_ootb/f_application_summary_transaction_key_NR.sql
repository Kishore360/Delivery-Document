SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.transaction_key' ELSE 'SUCCESS' END as Message
  from
     app_test.transaction_nr SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and 
                 SRC.sourceinstance=TRGT.source_id 
	 left join #DWH_TABLE_SCHEMA.d_transaction lov
	 on lov.row_id =CONCAT(SRC.name,'~',SRC.appId)
and lov.source_id = SRC.sourceinstance
 WHERE COALESCE(lov.row_key, case when SRC.appID is null then 0 else '-1' end)<> COALESCE(TRGT.transaction_key,0);
 