SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_sla.end_on' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.task_sla_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)

WHERE COALESCE(convert_tz(SRC.end_time,'GMT','America/Los_Angeles'),'') <> COALESCE(TRGT.end_on,'')
