SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_incident.incident_category_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,u_category from pdchs_mdsdb.incident_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_category_c lkp on  coalesce(src.u_category,'UNSPECIFIED')=lkp.row_id
where coalesce(lkp.row_key, case when src.u_category is null then 0 else -1 end) <> trgt.incident_category_c_key 
) temp;

