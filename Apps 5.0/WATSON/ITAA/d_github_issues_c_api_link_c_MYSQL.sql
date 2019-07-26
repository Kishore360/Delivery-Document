SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_github_issues_c.api_link_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.u_github_issues_final src
 left join watson_mdwdb.d_github_issues_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where coalesce(src.u_api_link,'UNSPECIFIED')<>trgt.api_link_c)ma	