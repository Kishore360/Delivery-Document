SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1)cnt from 
(select number,convert_tz( u_root_cause_identified,'GMT','America/New_york') u_root_cause_identified_c1,u_root_cause_identified_c,s.cdctype
from rogers6_mdsdb.problem_final s
join  rogers6_mdwdb.d_problem d on s.sys_id=d.row_id and s.sourceinstance=d.source_id
order by 1)a where u_root_cause_identified_c1<>u_root_cause_identified_c
and a.cdctype='X' 
 )a;