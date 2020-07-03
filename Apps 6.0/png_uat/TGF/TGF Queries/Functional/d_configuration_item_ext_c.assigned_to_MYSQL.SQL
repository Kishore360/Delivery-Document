SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item_ext_c.assigned_to' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.cmdb_ci_final SRC
JOIN png_mdwdb.f_configuration_item TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN png_mdwdb.d_configuration_item d on TRGT.configuration_item_key=d.row_key
LEFT JOIN (SELECT RIGHT(row_id,32) as row_id,source_id,row_key,full_name from png_mdwdb.d_internal_contact) LKP ON SRC.assigned_to=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE d.assigned_to<>LKP.full_name
) temp;



