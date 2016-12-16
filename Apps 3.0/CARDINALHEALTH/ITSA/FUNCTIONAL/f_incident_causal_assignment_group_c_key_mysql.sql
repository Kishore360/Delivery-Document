 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.incident_final a
JOIN  cardinalhealth_mdwdb.f_incident b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdsdb.problem_final ref
on a.problem_id=ref.sys_id 	AND a.sourceinstance=ref.sourceinstance
join cardinalhealth_mdwdb.d_internal_organization lkp
on COALESCE(CONCAT('GROUP~',LEFT(ref.u_causal_assignment_group,32)),'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when ref.u_causal_assignment_group is null then 0 else -1 end)<> b.causal_assignment_group_c_key)c

