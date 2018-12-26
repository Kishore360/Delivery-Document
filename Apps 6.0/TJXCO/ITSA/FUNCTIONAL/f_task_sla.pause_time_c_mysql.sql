SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_sla.pause_time_c' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from ( SELECT * FROM tjxco_mdsdb.task_sla_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.f_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.pause_time, 'GMT','America/New_York')=TRGT.pause_time_c) temp;