SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_problem.problem_management_group_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from (select sys_id, sourceinstance, u_problem_management_group from gilead_mdsdb.problem_final) src
left join gilead_mdwdb.f_problem  trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join gilead_mdwdb.d_internal_organization ref on concat('GROUP~',src.u_problem_management_group)=ref.row_id
WHERE coalesce(ref.row_key, case when src.u_problem_management_group is null then 0 else -1 end) <> trgt.problem_management_group_c_key) temp;
