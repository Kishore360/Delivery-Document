SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_ci_c.applied_date ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.task_ci_final src
 left join ibmwatson_mdwdb.d_task_ci_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where CONVERT_TZ (src.applied_date,'GMT','UTC')<>trgt.applied_date)ma;
 
 