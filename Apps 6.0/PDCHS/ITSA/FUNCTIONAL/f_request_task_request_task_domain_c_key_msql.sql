SELECT CASE WHEN CNT>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0   THEN 'MDS to DWH data validation failed for f_request_task.request_task_domain_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as CNT from 
(select sys_id,sourceinstance,sys_domain from pdchs_mdsdb.sc_task_final  where CDCTYPE<>'D') src  
left join pdchs_mdwdb.f_request_task f on src.sys_id=f.row_id and src.sourceinstance=f.source_id 
join pdchs_mdwdb.d_domain_c domain on src.sys_domain=domain.sys_id and src.sourceinstance=domain.source_id
where coalesce(domain.row_key, case when src.sys_domain is null then 0 else -1 end) <> f.request_task_domain_c_key) temp; 