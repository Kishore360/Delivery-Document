
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.resolved_by_c_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC
JOIN ibmwatson_mdwdb.d_case TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
JOIN ibmwatson_mdwdb.d_internal_contact LKP
ON (COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.resolved_by),'UNSPECIFIED')=LKP.row_id )
WHERE COALESCE (LKP.row_key,CASE WHEN SRC.resolved_by IS NULL THEN 0 ELSE -1 END)<>(TRGT.resolved_by_c_key))temp;