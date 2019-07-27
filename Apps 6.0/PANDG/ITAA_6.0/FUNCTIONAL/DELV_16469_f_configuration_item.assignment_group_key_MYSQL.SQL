SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_configuration_item.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.f_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_internal_organization LKP ON CONCAT('GROUP~',SRC.assignment_group)=LKP.row_id AND TRGT.pivot_date between effective_from and effective_to
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 ELSE -1 END)<>TRGT.assignment_group_key
AND SRC.cdctype<>'D'

) temp;




