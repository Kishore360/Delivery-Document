
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.problem_final s
left join asu_mdwdb.f_problem  t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join asu_mdwdb.d_internal_contact l
ON ( concat('INTERNAL_CONTACT~',s.u_requester)= l.row_id AND s.sourceinstance= l.source_id )
 WHERE COALESCE(l.row_key,CASE WHEN s.u_requester IS NULL THEN 0 else '-1' end)<> COALESCE(t.prob_requester_c_key,'')
) c
