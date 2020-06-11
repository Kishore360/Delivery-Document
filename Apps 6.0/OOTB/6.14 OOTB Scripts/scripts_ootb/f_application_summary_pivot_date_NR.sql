SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.pivot_date' ELSE 'SUCCESS' END as Message
   from (select  SRC.sys_id,date_format(FROM_UNIXTIME(SRC.timestamp/1000),'%Y-%m-%d %H:%i:%s') pivot, SRC.sourceinstance from app_test.transaction_nr SRC
    group by SRC.sys_id, SRC.sourceinstance) SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id 
    where coalesce(SRC.pivot,'') <> coalesce(TRGT.pivot_date, '')