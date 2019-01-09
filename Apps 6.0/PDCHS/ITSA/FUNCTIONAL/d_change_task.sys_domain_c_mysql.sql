SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_change_task.sys_domain_c' ELSE 'SUCCESS' END as Message 
FROM 
(select Count(1) as CNT from 
(select sys_id,sourceinstance,sys_domain from pdchs_mdsdb.change_task_final where CDCTYPE<>'D') src
JOIN  pdchs_mdwdb.d_change_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where coalesce(src.sys_domain, 'UNSPECIFIED') <> trgt.sys_domain_c ) temp;