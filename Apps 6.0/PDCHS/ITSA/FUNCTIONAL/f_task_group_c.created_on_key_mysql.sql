SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_task_group_c.created_on_key' ELSE 'SUCCESS' END as Message 
FROM(select count(1) as CNT from 
(select sys_id,sourceinstance, sys_created_on  from pdchs_mdsdb.task_group_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.f_task_group_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_calendar_date lkp 
on DATE_FORMAT(CONVERT_TZ(coalesce(src.sys_created_on),'GMT','America/New_york'),'%Y%m%d')=lkp.row_id 
where coalesce(lkp.row_key, case when src.sys_created_on is null then 0 else -1 end) <> trgt.created_on_key)temp;