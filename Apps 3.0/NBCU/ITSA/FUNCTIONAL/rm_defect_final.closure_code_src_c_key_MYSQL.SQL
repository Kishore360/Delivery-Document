
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for rm_defect_final.closure_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.task_final SRC 
JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
LEFT JOIN nbcu_mdsdb.rm_defect_final DF ON (SRC.sys_id=DF.sys_id AND SRC.sourceinstance=DF.sourceinstance AND SRC.sys_class_name='RM_DEFECT')
JOIN nbcu_mdwdb.d_lov LKP ON COALESCE( CONCAT('CLOSURE_CODE_C','~','RM_DEFECT','~','~','~',UPPER(DF.u_closure_code)),'UNSPECIFIED')=LKP.row_id AND DF.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN DF.u_closure_code IS NULL THEN 0 ELSE -1 END)<>TRGT.closure_code_src_c_key
) temp;

 

 