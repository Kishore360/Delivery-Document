SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_github_repositories_c.u_github_repository_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.u_github_repositories_final src
 left join watson_mdwdb.d_github_repositories_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where coalesce(src.u_github_repository,'UNSPECIFIED')<>trgt.u_github_repository_c)ma	;
 
 