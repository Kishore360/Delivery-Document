SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.u_incident_start_c' ELSE 'SUCCESS' END as Message 
from discover_mdsdb.problem_final src
inner join discover_mdwdb.f_problem dim
on src.sys_id=dim.row_id and src.sourceinstance=dim.source_id
where CONVERT_TZ(src.u_incident_start,'GMT','America/New_York')<>dim.u_incident_start_c;