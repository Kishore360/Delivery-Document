SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.opened_on' ELSE 'SUCCESS' END as Message
  FROM tjxco_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN tjxco_mdwdb.d_case TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 WHERE convert_tz(SRC.opened_at,'GMT','America/New_York') <> TRGT.opened_on ;

