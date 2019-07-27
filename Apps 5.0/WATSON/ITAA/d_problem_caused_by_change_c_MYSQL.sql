SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem.caused_by_change_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.problem_final src
 left join watson_mdwdb.d_problem trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where  case when src.u_caused_by_change=0 then 'N'  else 'Y' end <>trgt.caused_by_change_c )ma