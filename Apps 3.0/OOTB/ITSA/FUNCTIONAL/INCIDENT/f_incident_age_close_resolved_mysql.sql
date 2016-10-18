/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
<<<<<<< HEAD
select count(1) as cnt FROM (select * from <<tenant>>_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
=======

select count(1) as cnt FROM (select sys_id,sourceinstance,opened_at,resolved_at,closed_at from <<tenant>>_mdsdb.incident_final where opened_at < coalesce(resolved_at,closed_at)) SRC 
>>>>>>> c8fd627169326ceddb3b80bb47c00b9f1ed293dc
  join <<tenant>>_mdwdb.f_incident f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('RESOLVED','CLOSED')
JOIN <<tenant>>_mdwdb.d_incident a ON a.row_key = f.incident_key
AND f.source_id = a.source_id
WHERE
timestampdiff(DAY, SRC.opened_at, coalesce(SRC.resolved_at, SRC.closed_at)) <> f.age
  )a
  
  