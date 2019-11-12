SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_task_sla.end_on_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 wpl_mdsdb.task_sla_final a11
 left join wpl_mdwdb.f_task_sla a12
 ON a11.sys_id = a12.row_id  AND a11.sourceinstance = a12.source_id
where CONVERT_TZ (a11.end_time,'GMT','America/New_York')<>a12.end_on_c
 and a11.CDCTYPE='X')ma
  ;


