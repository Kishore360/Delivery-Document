SELECT 

CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_task_group.assignment_group_key' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt from (select d.sys_id, d.sourceinstance,d.group as grp  from  pdchs_mdsdb.task_group_final d where cdctype<>'D') SRC 

left join pdchs_mdwdb.f_task_group_c trgt 

on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id 

join pdchs_mdwdb.d_internal_organization lkp 

on COALESCE(CONCAT('GROUP~',SRC.grp),'UNSPECIFIED')=lkp.row_id 

where coalesce(lkp.row_key, case when SRC.grp is null then 0 else -1 end ) <> trgt.assignment_group_key) temp;