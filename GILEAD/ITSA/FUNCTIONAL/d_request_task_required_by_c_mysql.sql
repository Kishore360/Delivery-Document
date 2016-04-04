SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.changed_on' ELSE 'SUCCESS' END as Message  FROM gilead_mdsdb.sc_req_item_final SRC  LEFT JOIN gilead_mdwdb.d_request_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE convert_tz(SRC.u_required_by  ,'GMT','America/New_York')<> TRGT.required_by_c 
