SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from homedepot_mdsdb.incident_final SRC
JOIN homedepot_mdwdb.f_incident TRGT 
 on  TRGT.ROW_ID=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
join homedepot_mdwdb.d_problem LKP
on coalesce(SRC.problem_id,'UNSPECIFIED') = LKP.row_id  and LKP.source_id=SRC.sourceinstance
 where coalesce(LKP.row_key,CASE WHEN SRC.problem_id IS NULL THEN 0 else -1 end) <> TRGT.problem_key )b