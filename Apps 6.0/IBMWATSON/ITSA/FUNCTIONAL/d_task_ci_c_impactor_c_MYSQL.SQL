SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_ci_c.impactor_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.task_ci_final src
 left join ibmwatson_mdwdb.d_task_ci_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where CASE WHEN src.u_impactor = 0 THEN 'N' WHEN src.u_impactor = 1 THEN 'Y' END<>trgt.impactor_c)ma;
 
 