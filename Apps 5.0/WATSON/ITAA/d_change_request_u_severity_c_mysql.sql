SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_defect_rm_c.impact_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM watson_mdsdb.change_request_final SRC 
 LEFT JOIN watson_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  SRC.u_severity <> TRGT.u_severity_c)temp;
 