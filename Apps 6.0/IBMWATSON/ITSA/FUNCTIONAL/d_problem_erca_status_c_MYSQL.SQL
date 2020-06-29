SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem.erca_status_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.problem_final src
 left join ibmwatson_mdwdb.d_problem trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where  src.u_erca_status <>trgt.erca_status_c )ma