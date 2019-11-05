SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_on' ELSE 'SUCCESS' END as Message  FROM whirlpool_mdsdb.incident_final SRC  LEFT JOIN whirlpool_mdwdb.d_incident TRGT  ON 
(SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join  whirlpool_mdwdb.f_incident TRGTF  ON TRGTF.incident_key=TRGT.row_key
JOIN whirlpool_mdwdb.d_lov_map lkp
on TRGTF.state_src_key = lkp.src_key
WHERE convert_tz(coalesce(SRC.resolved_at,sys_updated_on),'GMT','America/New_York')<> (TRGT.closed_on)
AND dimension_wh_code = 'CLOSED' and SRC.cdctype='X'
