SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from ibmwatson_mdsdb.u_github_issues_final  SRC
 left  JOIN   ibmwatson_mdwdb. d_github_issues_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where case 
                    when SRC.u_case > 0 then 'Case' 
                    when SRC.u_incident > 0 then 'Incident' 
                    when SRC.u_problem > 0 then 'Problem' 
                    when SRC.u_problem_task > 0 then 'PTask' 
                    else 'Other' 
                end<>TRGT.github_parent_task_type_c and TRGT.soft_deleted_flag<>'Y') temp;
 
