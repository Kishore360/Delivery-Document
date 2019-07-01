SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident_task_c.incident_task_c_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from(select sys_id, sourceinstance,closed_at,cdctime from mcdonalds_mdsdb.incident_task_final) src      
LEFT JOIN mcdonalds_mdwdb.d_incident_task_c LKP ON src.sys_id = LKP.row_id and src.sourceinstance=LKP.source_id
Left join mcdonalds_mdwdb.f_incident_task_c  trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and coalesce(LKP.row_key, case when src.sys_id is null then 0 else -1 end)  <> trgt.incident_task_c_key) temp;