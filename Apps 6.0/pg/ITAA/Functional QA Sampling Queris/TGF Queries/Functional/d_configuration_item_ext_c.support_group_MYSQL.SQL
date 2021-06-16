SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.support_group' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
JOIN png_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN png_mdwdb.d_configuration_item d on TRGT.configuration_item_key=d.row_key
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key,organization_name from png_mdwdb.d_internal_organization) LKP ON SRC.support_group=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE d.support_group<>LKP.organization_name
) temp;



