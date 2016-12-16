select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem_task.age' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt FROM cardinalhealth_mdsdb.problem_task_final SRC 
  join cardinalhealth_mdwdb.f_problem_task f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN cardinalhealth_mdwdb.d_problem_task a ON a.row_key = f.problem_task_key
AND f.source_id = a.source_id
WHERE timestampdiff(second,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM cardinalhealth_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age_c

union

select count(1) FROM cardinalhealth_mdsdb.problem_task_final SRC 
  join cardinalhealth_mdwdb.f_problem_task f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN cardinalhealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
JOIN cardinalhealth_mdwdb.d_problem_task a ON a.row_key = f.problem_task_key
AND f.source_id = a.source_id
WHERE
timestampdiff(second, a.opened_on, a.closed_on) <> f.age_c
 )A
