SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.substate_c_key' ELSE 'SUCCESS' END as Message
FROM 
( Select Count(1) as CNT
FROM  keybank_mdsdb.change_request_final SRC 
LEFT JOIN keybank_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN keybank_mdwdb.d_lov LKP ON CONCAT('SUBSTATE_C','~','CHANGE_REQUEST','~',SRC.u_substate)=LKP.row_id AND 
SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_substate iS NULL THEN 0 ELSE -1 END)<>TRGT.substate_c_key
AND TRGT.soft_deleted_flag='N' ) temp