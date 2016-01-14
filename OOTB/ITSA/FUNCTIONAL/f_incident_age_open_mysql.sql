 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt FROM <<tenant>>_mdsdb.incident_final SRC 
  join <<tenant>>_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN <<tenant>>_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE timestampdiff(DAY,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age

 )A
