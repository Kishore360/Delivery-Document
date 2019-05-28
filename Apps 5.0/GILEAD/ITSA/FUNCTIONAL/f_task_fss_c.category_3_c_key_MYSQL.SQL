SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_fss_c.category_3_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1)  as CNT 
FROM gilead_mdsdb.u_task_fss_final SRC 
LEFT JOIN gilead_mdwdb.f_task_fss_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN gilead_mdwdb.d_sparc_category_choices_c LKP ON SRC.u_category_level_3=LKP.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_category_level_3  IS NULL THEN 0 ELSE -1 END)<>TRGT.category_3_c_key
AND TRGT.soft_deleted_flag='N'
) temp;


 