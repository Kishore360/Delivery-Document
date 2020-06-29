
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_case.status_src_c_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) cnt
FROM watson_mdsdb.problem_final SRC 
LEFT JOIN watson_mdwdb.d_problem TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_lov LKP ON (COALESCE(CONCAT('U_STATUS~PROBLEM~~~',SRC.u_status),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance=LKP.source_id
AND dimension_class ='U_STATUS~PROBLEM')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 ELSE -1 END)<>TRGT.status_src_c_key
) temp;