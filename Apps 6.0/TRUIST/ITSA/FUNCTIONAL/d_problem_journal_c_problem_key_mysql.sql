SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem_journal_c.problem_key' 
ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt
FROM
truist_mdsdb.sys_journal_field_final as sjf 
INNER JOIN truist_mdsdb.problem_final AS cs on sjf.element_id = cs.sys_id AND 
sjf.sourceinstance = cs.sourceinstance and sjf.name = 'task' AND sjf.element = 'work_notes'
left join truist_mdwdb.d_problem_journal_c TRGT
on sjf.sys_id=TRGT.row_id and sjf.sourceinstance=TRGT.source_id
left join truist_mdwdb.d_problem lkp 
on cs.sys_id=lkp.row_id and cs.sourceinstance=lkp.source_id
where case when sjf.element_id is null then 0 when lkp.row_id is null then '-1' else coalesce(lkp.row_key,0) end<>TRGT.problem_key) temp;
  
  