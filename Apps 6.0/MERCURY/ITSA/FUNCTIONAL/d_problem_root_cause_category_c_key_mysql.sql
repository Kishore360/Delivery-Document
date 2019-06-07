SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

mercury_mdsdb.problem_final a
join mercury_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id and a.cdctype='X'
left join mercury_mdwdb.d_lov c
on CONCAT('ROOT_CAUSE_CATEGORY~PROBLEM~',a.u_root_cause_category)=c.src_rowid
and c.current_flag='Y'
where c.row_key<>b.root_cause_category_c_key
