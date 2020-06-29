SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_github_repositories_c.u_repository_url_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.u_github_repositories_final src
 left join ibmwatson_mdwdb.d_github_repositories_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where coalesce(src.u_repository_url,'UNSPECIFIED')<>trgt.u_repository_url_c)ma	;
 
 