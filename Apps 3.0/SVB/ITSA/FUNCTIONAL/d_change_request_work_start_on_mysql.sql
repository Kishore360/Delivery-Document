
SELECT  * 
 FROM  svb_mdsdb.change_request_final SRC 
 LEFT JOIN  svb_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE convert_tz(SRC.work_start,'GMT','America/Los_Angeles')<>TRGT.work_start_on