select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt FROM asu_mdsdb.hr_case_final SRC 
  join asu_mdwdb.f_hr_case_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN asu_mdwdb.d_hr_case_c a ON a.row_key = f.hr_case_c_key
AND f.source_id = a.source_id
JOIN asu_mdwdb.d_lov_map br ON a.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
WHERE timestampdiff(day,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM asu_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age

union

select count(1) FROM asu_mdsdb.hr_case_final SRC 
  join asu_mdwdb.f_hr_case_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN asu_mdwdb.d_hr_case_c a ON a.row_key = f.hr_case_c_key
AND f.source_id = a.source_id
JOIN asu_mdwdb.d_lov_map br ON a.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')

WHERE
timestampdiff(day, a.opened_on, a.closed_on) <> f.age
  OR f.age IS NULL
)A