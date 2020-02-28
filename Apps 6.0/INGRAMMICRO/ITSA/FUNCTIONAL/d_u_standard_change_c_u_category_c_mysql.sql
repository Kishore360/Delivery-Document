SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_standard_change_c.u_category_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_standard_change_table_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_u_standard_change_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_category,'UNSPECIFIED')<>TRGT.u_category_c
AND SRC.cdctype='X' ) temp; 