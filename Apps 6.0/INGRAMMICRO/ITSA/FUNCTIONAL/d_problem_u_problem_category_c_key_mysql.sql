SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.closed_by_key' ELSE 'SUCCESS' END as Message FROM (
Select count(1) as CNT
FROM    ingrammicro_mdsdb.problem_final SRC 
left JOIN ingrammicro_mdwdb.d_lov LKP ON
CONCAT('CATEGORY','~','PROBLEM','~',upper(SRC.u_problem_category))=LKP.row_id AND SRC.sourceinstance=LKP.source_id
 JOIN ingrammicro_mdwdb.d_problem TRGT ON sys_id= TRGT.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_problem_category is NULL THEN 0 ELSE -1 END)<>TRGT.u_problem_category_c_key) temp;

