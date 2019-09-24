SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1)cnt from 
(select number,timestampdiff(second,convert_tz(sys_created_on,'GMT','America/New_York'),
convert_tz(u_root_cause_identified,'GMT','America/New_York'))rca_duration_c1 ,rca_duration_c,s.CDCTYPE
from rogers_mdsdb.problem_final s
join   rogers_mdwdb.f_problem d on s.sys_id=d.row_id and s.sourceinstance=d.source_id
order by 1)a where rca_duration_c1<>rca_duration_c 
and a.CDCTYPE='X'  )a;