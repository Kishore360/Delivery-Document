SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message  FROM molinahealth_mdsdb.u_hr_task_final SRC  LEFT JOIN molinahealth_mdwdb.d_hr_task_c TRGT  ON 
(SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
JOIN molinahealth_mdwdb.d_lov_map lkp
on TRGT.state_src_key = lkp.src_key
WHERE convert_tz(coalesce(SRC.closed_at,sys_updated_on),'GMT','America/Los_Angeles')<> (TRGT.closed_on)
AND dimension_wh_code = 'CLOSED'

