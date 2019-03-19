SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_change_task.change_task_domain_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,sys_domain from pdchs_mdsdb.change_task_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.f_change_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_domain_c lkp on src.sys_domain=lkp.row_id
where coalesce(lkp.row_key, case when src.sys_domain is null then 0 else -1 end) <> trgt.change_task_domain_c_key ) temp;