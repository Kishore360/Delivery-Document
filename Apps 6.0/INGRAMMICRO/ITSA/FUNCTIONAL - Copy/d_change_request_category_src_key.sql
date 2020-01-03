SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_change_request.category_src_key' ELSE 'SUCCESS' END as Message
FROM 
( Select count(1) as CNT
FROM  ingrammicro_mdsdb.u_change_request_v2_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_change_request TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_lov LKP ON
CONCAT('CATEGORY','~','CHANGE_REQUEST','~',upper(SRC.u_category))=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_category iS NULL THEN 0 ELSE -1 END) <> TRGT.category_src_key
AND TRGT.soft_deleted_flag='N' ) temp;  
