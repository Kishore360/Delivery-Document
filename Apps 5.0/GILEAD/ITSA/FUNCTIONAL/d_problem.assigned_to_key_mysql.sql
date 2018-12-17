SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_problem.assigned_to_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from (select sys_id, sourceinstance, assigned_to from gilead_mdsdb.problem_task_final) src
left join gilead_mdwdb.f_problem_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join gilead_mdwdb.d_internal_contact ref on concat('INTERNAL_CONTACT~',src.assigned_to)=ref.row_id
WHERE coalesce(ref.row_key, case when src.assigned_to is null then 0 else -1 end) <> trgt.assigned_to_key) temp;