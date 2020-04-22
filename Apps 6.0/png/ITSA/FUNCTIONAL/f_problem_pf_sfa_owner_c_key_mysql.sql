SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.sfa_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM  png_mdsdb.problem_final SRC 
 JOIN png_mdwdb.f_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id and SRC.cdctype<>'D'
LEFT JOIN png_mdwdb.d_internal_contact LKP ON (CONCAT('INTERNAL_CONTACT','~',SRC.u_pf_sfa_owner)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pf_sfa_owner IS NULL THEN 0 ELSE -1 END)<>TRGT.pf_sfa_owner_c_key
) temp; 