
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  rogers_mdsdb.problem_final s
left join rogers_mdwdb.f_problem t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join rogers_mdwdb.d_kb_knowledge_c l
on s.u_knowledge_record = l.row_id and s.sourceinstance=l.source_id
 WHERE kb_knowledge_c_key <> coalesce(l.row_key, case when s.u_knowledge_record is null then 0 else -1 end)
and s.CDCTYPE='X' and l.soft_deleted_flag='N') temp
