	SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem_journal_c.work_notes' 
 ELSE 'SUCCESS' END as Message 
 from (select count(1) as cnt
 FROM
  truist_mdsdb.sys_journal_field_final as sjf 
 INNER JOIN (select * from truist_mdsdb.problem_final where cdctype<>'D') AS cs on sjf.element_id = cs.sys_id AND 
 sjf.sourceinstance = cs.sourceinstance and
 sjf.name = 'task' AND sjf.element = 'work_notes'
 left join truist_mdwdb.d_problem_journal_c TRGT
 on sjf.sys_id=TRGT.row_id and sjf.sourceinstance=TRGT.source_id
  where sjf.value <> TRGT.work_notes) temp
  
  
  