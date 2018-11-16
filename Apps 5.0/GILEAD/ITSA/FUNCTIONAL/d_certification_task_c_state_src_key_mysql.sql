SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.incident_action_c_key' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,state from gilead_mdsdb.cert_task_final ) src
LEFT JOIN  gilead_mdwdb.d_certification_task_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN gilead_mdwdb.d_lov lkp
ON COALESCE(CONCAT('STATE~CERT_TASK~~~',src.state),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.state IS NULL THEN 0 else -1 end)<> trgt.state_src_key
