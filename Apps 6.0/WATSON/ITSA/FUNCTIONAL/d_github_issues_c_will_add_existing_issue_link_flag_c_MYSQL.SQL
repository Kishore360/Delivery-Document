SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_github_issues_c.will_add_existing_issue_link_flag_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.u_github_issues_final src
 left join ibmwatson_mdwdb.d_github_issues_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where case when src.u_will_add_existing_issue_link=1 then 'Y' else 'N' end <>trgt.will_add_existing_issue_link_flag_c)ma	