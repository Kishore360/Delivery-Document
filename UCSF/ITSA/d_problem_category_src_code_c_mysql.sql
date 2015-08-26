SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdsdb.problem_final a
left join ucsf_mdwdb.d_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.u_category,'No category found')<>b.category_src_code_c;