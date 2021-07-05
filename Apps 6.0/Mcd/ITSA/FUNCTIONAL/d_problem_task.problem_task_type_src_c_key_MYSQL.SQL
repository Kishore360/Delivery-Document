SELECT CASE WHEN CNT> 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT> 0  THEN 'MDS to DWH data validation failed for d_problem_task.problem_task_type_src_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from    mcd_mdsdb.problem_task_final src
left join mcd_mdwdb.d_problem_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join mcd_mdwdb.d_lov lkp on COALESCE(CONCAT('TYPE_C~PROBLEM_TASK~~~',UPPER(src.u_type)),'UNSPECIFIED')=lkp.row_id and src.sourceinstance=lkp.source_id
WHERE COALESCE(lkp.row_key,case when src.u_type is null then 0 else -1 end) <>trgt.problem_task_type_src_c_key
)temp;
         
         