SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.generated_on_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN usf_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
 LEFT JOIN usf_mdwdb.d_calendar_date LKP 
 ON (date_format(convert_tz(SRC.date,source_time_zone,target_time_zone),'%Y%m%d')= LKP.row_id )
-- AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.date IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.generated_on_key,'')and SRC.asset is not null;

