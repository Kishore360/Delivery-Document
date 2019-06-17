-- organization_manager_c_key(manager_key)
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.manager_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.sys_user_final SRC1 ON SRC.assignment_group=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.f_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_internal_contact LKP1 ON CONCAT('INTERNAL_CONTACT~',SRC1.manager)=LKP1.row_id AND SRC1.source=LKP1.source_id 
LEFT JOIN png_mdwdb.d_internal_organization LKP2 
ON CONCAT('GROUP~',SRC.assignment_group)=LKP2.row_id  AND TRGT.pivot_date between LKP2.effective_from and LKP2.effective_to
WHERE COALESCE(LKP1.row_key, CASE WHEN SRC1.manager IS NULL THEN 0 ELSE -1 END)<>LKP2.manager_key
AND SRC.cdctype='X'
) temp;




 