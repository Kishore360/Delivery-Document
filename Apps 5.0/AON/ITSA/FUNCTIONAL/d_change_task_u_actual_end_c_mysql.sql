 
 
 
 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_task.u_actual_end_c
' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.change_task_final SRC
 LEFT JOIN aon_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  WHERE COALESCE(CONVERT_TZ(SRC.u_actual_end,'GMT','US/Central'),'')
<> (TRGT.u_actual_end_c
))b;

			