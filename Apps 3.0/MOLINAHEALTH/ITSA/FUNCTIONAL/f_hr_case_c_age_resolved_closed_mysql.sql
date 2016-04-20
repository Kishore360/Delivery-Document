  select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select sourceinstance,sys_id,opened_at,closed_at from molinahealth_mdsdb.u_hr_case_final where opened_at < closed_at) SRC 
  join molinahealth_mdwdb.f_hr_case_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN molinahealth_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
and br.dimension_class = 'STATE~HR_CASE'
WHERE
timestampdiff(DAY, SRC.opened_at,  SRC.closed_at) <> f.age
  )a
  
  