SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.u_change_bp_location_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
JOIN ingrammicro_mdwdb.f_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_u_change_bp_location_c LKP on LKP.row_id=coalesce(SRC.u_bp_location,'UNSPECIFIED')
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_bp_location is NULL THEN 0 ELSE -1 END)<>TRGT.u_change_bp_location_c_key ) temp;