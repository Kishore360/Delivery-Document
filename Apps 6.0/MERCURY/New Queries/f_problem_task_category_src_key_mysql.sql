SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.category_src_key' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.problem_task_final  SRC 
JOIN mercury_mdwdb.f_problem_task TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) 
join mercury_mdwdb.d_lov LKP
on COALESCE(CONCAT('CATEGORY','~','problem_task','~',UPPER(SRC.category)),'UNSPECIFIED')= LKP.row_id 
where coalesce(LKP.row_key,case when SRC.category is null then 0 else -1 end) <>TRGT.category_src_key and SRC.CDCTYPE<>'D'