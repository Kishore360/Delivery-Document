SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_fss_c.task_ra_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1)  as CNT 
FROM gilead_mdsdb.u_task_fss_final SRC 
LEFT JOIN gilead_mdsdb.task_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN gilead_mdwdb.f_task_fss_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN gilead_mdwdb.d_task LKP ON SRC1.sys_id=LKP.row_id AND SRC1.sourceinstance=LKP.source_id
WHERE 
(COALESCE(LKP.row_key, CASE WHEN SRC1.sys_id IS NULL THEN 0 ELSE -1 END))<>TRGT.task_ra_c_key
AND TRGT.soft_deleted_flag='N'
) temp;


  