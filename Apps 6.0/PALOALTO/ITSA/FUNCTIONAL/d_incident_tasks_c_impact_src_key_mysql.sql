SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.u_incident_tasks_final a
 join paloalto_mdwdb.d_incident_tasks_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 left join paloalto_mdwdb.d_lov c
 on COALESCE(CONCAT('IMPACT','~','INCIDENT_TASKS','~',UPPER(a.impact )),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
 where COALESCE(c.row_key,case when a.impact is null then 0 else -1 end)<>b.impact_src_key;
 
