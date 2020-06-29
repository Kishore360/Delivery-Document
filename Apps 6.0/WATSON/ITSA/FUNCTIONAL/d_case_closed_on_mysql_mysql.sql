SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.closed_on' ELSE 'SUCCESS' END as Message
  FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN ibmwatson_mdwdb.d_case TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
where convert_tz(SRC.closed_at,'GMT','UTC')<> TRGT.closed_on;