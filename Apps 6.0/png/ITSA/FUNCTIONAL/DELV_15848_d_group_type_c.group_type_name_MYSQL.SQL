SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_group_type_c.group_type_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sys_user_group_final SRC 
LEFT JOIN png_mdwdb.d_group_type_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.name,'UNSPECIFIED')<>TRGT.group_type_name
AND SRC.cdctype='X'
) temp;
 
 
  
  

