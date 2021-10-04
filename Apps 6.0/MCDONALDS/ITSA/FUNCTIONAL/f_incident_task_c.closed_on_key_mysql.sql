SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident_task_c.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from(select sys_id, sourceinstance,closed_at,cdctime from mcd_mdsdb.incident_task_final) src      
LEFT JOIN mcd_mdwdb.d_calendar_date LKP ON COALESCE(DATE_FORMAT(CONVERT_TZ(src.closed_at,'GMT','US/Central'),'%Y%m%d'),'UNSPECIFIED') = LKP.row_id 
Left join mcd_mdwdb.f_incident_task_c  trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and coalesce(LKP.row_key, case when src.closed_at is null then 0 else -1 end)  <> trgt.closed_on_key) temp;