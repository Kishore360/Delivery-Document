
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_case.status_src_c_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_case TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP ON (COALESCE(CONCAT('STATUS_SRC_C~CASE~~~',SRC.action_status),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance=LKP.source_id
AND dimension_class ='STATUS_SRC_C~CASE')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.action_status IS NULL THEN 0 ELSE -1 END)<>TRGT.status_src_c_key
) temp;

