SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for f_problem.category_src_key' ELSE 'SUCCESS' END as Message
FROM bbandt_mdwdb.f_problem a11
join bbandt_mdsdb.problem_final a12 on a11.row_id = a12.sys_id and a11.source_id = a12.sourceinstance
left join bbandt_mdwdb.d_lov LKP ON CONCAT('CATEGORY_C~PROBLEM~~~',UPPER(a12.u_category)) = LKP.row_id and a12.sourceinstance = LKP.source_id
where COALESCE(LKP.row_key,CASE WHEN a12.u_category IS NULL THEN 0 ELSE -1 END) <> a11.category_src_key;