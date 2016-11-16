
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_task.age' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt FROM wow_mdsdb.sc_task_final SRC 
  join wow_mdwdb.f_request_task f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN wow_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN wow_mdwdb.d_request_task a ON a.row_key = f.request_task_key
AND f.source_id = a.source_id
WHERE timestampdiff(second,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM wow_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age_c

union

select count(1) FROM wow_mdsdb.sc_task_final SRC 
  join wow_mdwdb.f_request_task f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN wow_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
JOIN wow_mdwdb.d_request_task a ON a.row_key = f.request_task_key
AND f.source_id = a.source_id
WHERE
timestampdiff(second, a.opened_on,  a.closed_on) <> f.age_c
  OR f.age_c IS NULL
 )A
