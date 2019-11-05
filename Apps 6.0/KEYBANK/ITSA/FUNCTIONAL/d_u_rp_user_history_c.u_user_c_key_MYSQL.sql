

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_rp_user_history_c.u_user_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM keybank_mdsdb.u_rp_user_history_final SRC 
JOIN keybank_mdwdb.d_u_rp_user_history_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN keybank_mdwdb.d_internal_contact LKP ON concat('INTERNAL_CONTACT~',SRC.u_user)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_user is NULL THEN 0 ELSE -1 END)<>TRGT.u_user_c_key 
and SRC.cdctype='X' and TRGT.soft_deleted_flag='N') temp;

