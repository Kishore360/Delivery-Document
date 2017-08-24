SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.start_on_key     ' ELSE 'SUCCESS' END as Message 
FROM (
SELECT trgt.row_id,src.sys_id,src.start_time,lkp.row_key,
COALESCE(lkp.row_key, CASE WHEN src.start_time IS NULL THEN 0 ELSE -1 end),
COALESCE(DATE_FORMAT(CONVERT_TZ(src.start_time,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
 , coalesce(start_on_key)
FROM molinahealth_mdwdb.f_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN molinahealth_mdwdb.d_calendar_date lkp
ON COALESCE(DATE_FORMAT(CONVERT_TZ(src.start_time,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') = lkp.row_id
WHERE COALESCE(lkp.row_key, CASE WHEN src.start_time IS NULL THEN 0 ELSE -1 end) <> start_on_key

)a
