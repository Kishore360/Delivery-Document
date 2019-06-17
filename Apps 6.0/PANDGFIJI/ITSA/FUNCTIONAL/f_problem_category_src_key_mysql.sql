SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.category_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM  png_mdsdb.problem_final SRC 
LEFT JOIN png_mdwdb.f_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_lov LKP ON CONCAT('CATEGORY_C','~','PROBLEM','~',SRC.u_pg_category)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_category iS NULL THEN 0 ELSE -1 END)<>TRGT.category_src_key
AND TRGT.soft_deleted_flag='N'
) temp;





