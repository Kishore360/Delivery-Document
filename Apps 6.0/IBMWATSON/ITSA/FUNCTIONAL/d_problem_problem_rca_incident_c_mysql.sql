
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
(
select count(1)cnt 
from ibmwatson_mdsdb.problem_final a
left join ibmwatson_mdwdb.d_problem b  on sys_id=row_id and b.source_id=2
where  coalesce(u_incident,0)<>coalesce(problem_rca_incident_c,0))a

