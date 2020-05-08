-- AG Parent was developed by OOTB and created the Hierarchy in the OOTB d_internal_organization
-- if the Query is not runing change the target mdwdb schema

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.parent_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.incident_final SRC 
LEFT JOIN png_mdsdb.sys_user_group_final SRC1 ON SRC.assignment_group=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.sys_user_group_final LKP ON SRC1.parent=LKP.sys_id AND SRC1.sourceinstance=LKP.sourceinstance
JOIN pgitsa_mdwdb.d_internal_organization a ON SRC1.sys_id=right(a.row_id,32) AND SRC1.sourceinstance=a.source_id
JOIN pgitsa_mdwdb.d_internal_organization TRGT ON LKP.sys_id=right(TRGT.row_id,32) AND LKP.sourceinstance=TRGT.source_id
WHERE 
COALESCE(TRGT.row_key,CASE WHEN SRC1.parent IS NULL THEN 0 ELSE -1 END)<>a.parent_c_key
AND SRC.cdctype='X'
)temp;
