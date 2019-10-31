SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_rp_user_history_c.u_manager_4_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM keybank_mdsdb.u_rp_user_history_final SRC 
LEFT JOIN keybank_mdwdb.d_u_rp_user_history_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join keybank_mdsdb.sys_user_final LKP on LKP.sys_id=SRC.u_user
WHERE coalesce(SRC.u_manager_4,'UNSPECIFIED')<>TRGT.u_manager_4_c
AND SRC.cdctype='X' and TRGT.soft_deleted_flag='N'  ) temp; 
