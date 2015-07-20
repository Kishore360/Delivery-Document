
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.created_on' ELSE 'SUCCESS' END as Message
  FROM usf_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN usf_mdwdb.d_expense_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
 WHERE convert_tz(SRC.sys_created_on,source_time_zone,target_time_zone)<> TRGT.created_on and SRC.asset is not null;
