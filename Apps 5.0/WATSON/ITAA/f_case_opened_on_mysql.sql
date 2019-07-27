SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_case.opened_on' ELSE 'SUCCESS' END as Message
  FROM (select count(1) as cnt from watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.f_case TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 WHERE convert_tz(SRC.opened_at,'GMT','UTC')<>TRGT.opened_on )ma
