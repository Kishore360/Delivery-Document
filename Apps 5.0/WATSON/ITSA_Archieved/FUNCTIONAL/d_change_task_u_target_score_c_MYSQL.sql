SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_task.u_target_score_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.change_task_final src
 left join watson_mdwdb.d_change_task trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where src.u_target_score<>trgt.u_target_score_c )ma