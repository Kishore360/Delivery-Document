/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM (select * from gogo_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
  join gogo_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN gogo_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
<<<<<<< HEAD
JOIN gogo_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
=======

>>>>>>> 564debcc25aa13a30462bda479fd42ec75ac9bec
WHERE
timestampdiff(DAY, SRC.opened_at, coalesce(SRC.u_resolved, SRC.closed_at)) <> f.age
  )a
  
  