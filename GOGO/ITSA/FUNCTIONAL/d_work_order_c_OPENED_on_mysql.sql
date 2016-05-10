
  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message  FROM gogo_mdsdb.wm_order_final SRC  LEFT JOIN gogo_mdwdb.d_work_order_c TRGT  ON 
(SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
JOIN gogo_mdwdb.d_lov_map lkp
on TRGT.state_src_key = lkp.src_key
WHERE convert_tz(SRC.OPENED_at),'GMT','America/Chicago')<> (TRGT.OPENED_on)
AND dimension_wh_code = 'OPENED'