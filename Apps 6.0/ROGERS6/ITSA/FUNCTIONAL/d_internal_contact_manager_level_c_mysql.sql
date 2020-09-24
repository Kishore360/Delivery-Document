SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.manager_level_c' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
FROM rogers6_mdsdb.sys_user_final SRC 
LEFT JOIN rogers6_mdwdb.d_internal_contact TRGT ON (concat('INTERNAL_CONTACT~',SRC.sys_id)=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_manager_level,'UNSPECIFIED')<>TRGT.manager_level_c
AND SRC.cdctype='X' ) temp; 
