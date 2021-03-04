SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DWD Data Validation Failed for d_change_request.change_opened_by_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM ntt_amgen_mdsdb.change_request_final SRC 
LEFT JOIN ntt_amgen_mdwdb.d_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN ntt_amgen_mdwdb.d_internal_contact LKP  ON CONCAT('INTERNAL_CONTACT~',SRC.opened_by)=LKP.row_id 
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.opened_by IS NULL THEN 0 ELSE -1 END)<>TRGT.change_opened_by_c_key
AND SRC.cdctype='X';
) temp;




 