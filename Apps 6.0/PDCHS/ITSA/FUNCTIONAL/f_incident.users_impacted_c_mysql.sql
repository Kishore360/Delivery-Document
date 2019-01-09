SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_incident.users_impacted_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,u_users_impacted from pdchs_mdsdb.incident_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.f_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where src.u_users_impacted <> trgt.users_impacted_c ) temp;