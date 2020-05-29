SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.day_key' ELSE 'SUCCESS' END as Message
  from
     app_test.transaction_nr SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and 
                 SRC.sourceinstance=TRGT.source_id 
	 left join #DWH_TABLE_SCHEMA.d_calendar_date lov
	 on lov.row_id =(DATE_FORMAT(FROM_UNIXTIME(SRC.timestamp/1000),'%Y%m%d')) 
	 where coalesce(lov.row_key,'') <> coalesce(TRGT.day_key,'') 