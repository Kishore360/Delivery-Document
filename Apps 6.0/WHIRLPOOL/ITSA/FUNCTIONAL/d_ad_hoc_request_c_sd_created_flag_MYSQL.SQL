SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.sd_created_flag' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
whirlpool_mdsdb.u_ad_hoc_request_final src
left join whirlpool_mdwdb.d_ad_hoc_request_c trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
join whirlpool_mdsdb.task_final task
on src.sys_id = task.sys_id and src.sourceinstance = task.sourceinstance
where CASE WHEN task.u_sd_created = 1 THEN 'Y' ELSE 'N' END<>trgt.sd_created_flag and trgt.cdctype='X')ma