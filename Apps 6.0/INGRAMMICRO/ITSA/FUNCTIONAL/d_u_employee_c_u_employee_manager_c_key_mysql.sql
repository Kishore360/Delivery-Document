SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_employee_c.u_employee_manager_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ingrammicro_mdsdb.u_employee_final SRC 
JOIN ingrammicro_mdwdb.d_u_employee_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_internal_contact LKP ON coalesce(concat('INTERNAL_CONTACT','~',SRC.u_manager),'UNSPECIFIED')
=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_manager is NULL THEN 0 ELSE -1 END)<>TRGT.u_employee_manager_c_key ) temp;