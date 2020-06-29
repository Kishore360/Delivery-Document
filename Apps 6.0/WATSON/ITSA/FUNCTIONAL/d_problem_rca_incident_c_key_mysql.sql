
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
(
select count(1)cnt 
from ibmwatson_mdsdb.problem_final a
left join ibmwatson_mdwdb.d_problem b  on sys_id=row_id and b.source_id=2
left join ibmwatson_mdwdb.d_incident c on a.u_incident=c.row_id and c.source_id=2
coalesce(c.row_key,case when u_incident is null then 0 else -1 end )<>rca_incident_c_key)a

