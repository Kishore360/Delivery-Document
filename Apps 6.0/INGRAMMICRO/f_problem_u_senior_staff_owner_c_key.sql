SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.u_senior_staff_owner_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ingrammicro_mdsdb.problem_final SRC 
JOIN ingrammicro_mdwdb.f_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_internal_contact LKP ON coalesce(concat('INTERNAL_CONTACT','~',SRC.u_senior_staff_owner),'UNSPECIFIED')
=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_senior_staff_owner is NULL THEN 0 ELSE -1 END)<>TRGT.u_senior_staff_owner_c_key ) temp;