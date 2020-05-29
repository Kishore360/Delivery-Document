SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.application_key' ELSE 'SUCCESS' END as Message
  from
   app_test.transaction_nr SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and 
                 SRC.sourceinstance=TRGT.source_id 
     left join #DWH_TABLE_SCHEMA.d_application app
     on CONCAT('APPLICATION~',SRC.appid) = app.row_id and SRC.sourceinstance = app.source_id
	 where coalesce(app.row_key,'') <> coalesce(TRGT.application_key,'')