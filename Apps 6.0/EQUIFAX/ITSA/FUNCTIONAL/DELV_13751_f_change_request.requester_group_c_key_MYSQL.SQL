
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.requester_group_c_key' ELSE 'SUCCESS' END as Message
FROM
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.change_request_final SRC 
LEFT JOIN equifax_mdwdb.f_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN equifax_mdwdb.d_internal_organization LKP ON CONCAT('GROUP~',SRC.u_requester_group)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_requester_group IS NULL THEN 0 ELSE -1 END )<>TRGT.requester_group_c_key and SRC.cdctype<>'D'
) temp;










 