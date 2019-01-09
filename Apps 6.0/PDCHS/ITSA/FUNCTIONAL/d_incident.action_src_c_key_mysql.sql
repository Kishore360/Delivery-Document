SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_incident.action_src_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,u_action from pdchs_mdsdb.incident_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_lov lkp on concat('ACTION_C~INCIDENT~', src.u_action)=lkp.row_id
where coalesce(lkp.row_key, case when src.u_action is null then 0 else -1 end) <> trgt.action_src_c_key ) temp;