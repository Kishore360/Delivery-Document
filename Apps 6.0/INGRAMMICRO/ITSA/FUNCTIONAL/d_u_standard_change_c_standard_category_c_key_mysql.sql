SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_u_standard_change_c.standard_category_c_key' ELSE 'SUCCESS' END as Message
FROM 
( Select count(1) as CNT
FROM  ingrammicro_mdsdb.u_standard_change_table_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_u_standard_change_c TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_lov LKP ON
CONCAT('CATEGORY_C','~','STANDARD_CHANGE','~',upper(SRC.u_category))=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_category iS NULL THEN 0 ELSE -1 END) <> TRGT.standard_category_c_key
AND TRGT.soft_deleted_flag='N' ) temp;