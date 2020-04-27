
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_u_server_modification_task_c.contact_type_src_c_key' ELSE 'SUCCESS' END as Message

FROM 
( Select Count(1) as CNT
FROM  ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_u_server_modification_task_c TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_lov LKP ON
CONCAT('SERVER_MODIFICATION_TASK_C','~','CONTACT_TYPE','~',SRC.contact_type)=LKP.row_id AND SRC.sourceinstance=LKP.source_id

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type iS NULL THEN 0 ELSE -1 END)<>TRGT.contact_type_src_c_key

AND TRGT.soft_deleted_flag='N' ) temp;
