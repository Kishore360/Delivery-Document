
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.created_on' ELSE 'SUCCESS' END as Message
  FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
 -- JOIN  app_test.lsm_ls_source_timezone L 
-- 	ON (SRC.sourceinstance = L.sourceid)
WHERE TRGT.row_key not in (0, -1) and 
convert_tz(SRC.sys_created_on,'GMT','UTC')<> TRGT.created_on 
