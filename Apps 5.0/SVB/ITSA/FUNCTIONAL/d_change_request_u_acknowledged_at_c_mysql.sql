

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.u_acknowledged_at_c' ELSE 'SUCCESS' END as Message from(

 SELECT count(1) cnt 
 FROM  svb_mdsdb.change_request_final SRC 
 LEFT JOIN  svb_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE convert_tz(SRC.u_acknowledged_at,'GMT','America/Los_Angeles')<>TRGT.u_acknowledged_at_c)x