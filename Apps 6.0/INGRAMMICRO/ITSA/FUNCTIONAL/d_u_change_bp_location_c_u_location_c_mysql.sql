SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_change_bp_location_c.u_location_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_bp_location_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_u_change_bp_location_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_location,'UNSPECIFIED')<>TRGT.u_location_c
AND SRC.cdctype='X' ) temp; 