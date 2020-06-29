

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  ibmwatson_mdsdb.problem_final a11
left join ibmwatson_mdwdb.d_lov d 
on row_id=concat('DETECTION_SOURCE_C~PROBLEM~~~',u_detection_source)
 join ibmwatson_mdwdb.d_problem  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where coalesce(d.row_key,case when u_detection_source is null then 0 else -1 end  ) <>a12.detection_source_src_c_key )a


