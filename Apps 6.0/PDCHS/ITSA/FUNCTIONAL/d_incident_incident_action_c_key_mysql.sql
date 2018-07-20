
 SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.incident_action_c_key' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_action from pdchs_mdsdb.incident_final where CDCTYPE<>'D') src
LEFT JOIN  pdchs_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pdchs_mdwdb.d_lov lkp
ON COALESCE(CONCAT('ACTION_C~INCIDENT~',src.u_action),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.u_action IS NULL THEN 0 else -1 end)<> trgt.incident_action_c_key
;
