SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.time_key' ELSE 'SUCCESS' END as Message
  from
     app_test.transaction_nr SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and 
                 SRC.sourceinstance=TRGT.source_id 
	 left join #DWH_TABLE_SCHEMA.d_calendar_time lov
	 on lov.row_id =DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%H%i')
 and lov.source_id = 0
 WHERE COALESCE(case when SRC.timestamp is null then 0 else lov.row_key end,-1)<> COALESCE(TRGT.time_key,-1);