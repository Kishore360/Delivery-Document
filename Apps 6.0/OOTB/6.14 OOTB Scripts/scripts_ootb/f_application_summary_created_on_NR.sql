SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.created_on' ELSE 'SUCCESS' END as Message
    from app_test.transaction_nr SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
    where coalesce(date_format(FROM_UNIXTIME(SRC.timestamp/1000-MOD(SRC.timestamp/1000,600)),'%Y-%m-%d %H:%i:%S'),'') <> coalesce(TRGT.created_on, '')