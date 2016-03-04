SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select COUNT(1) as cnt
FROM richemont_mdsdb.problem_final SRC  
LEFT JOIN richemontdev_mdwdb.d_problem TRGT  
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
WHERE convert_tz(SRC.u_planned_resolution_date,'GMT','Europe/Zurich')<> TRGT.planned_resolution_date_c ) temp;
