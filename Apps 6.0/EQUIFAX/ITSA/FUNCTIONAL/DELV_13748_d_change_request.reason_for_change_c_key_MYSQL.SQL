



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.reason_for_change_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.change_request_final SRC 
LEFT JOIN equifax_mdwdb.d_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN equifax_mdwdb.d_lov LKP ON CONCAT('U_REASON_FOR_CHANGE_C~','CHANGE_REQUEST','~',SRC.u_reason_for_change)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_reason_for_change IS NULL THEN 0 ELSE -1 END)<>TRGT.reason_for_change_c_key
) temp;




