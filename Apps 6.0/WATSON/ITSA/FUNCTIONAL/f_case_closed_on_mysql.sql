SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_case.closed_on' ELSE 'SUCCESS' END as Message
  FROM(select count(1) as cnt from  ibmwatson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN ibmwatson_mdwdb.f_case TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 WHERE convert_tz(SRC.closed_at,'GMT','UTC')<>TRGT.closed_on )ma
