SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.serial_number' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.serial_number,'UNSPECIFIED')<>TRGT.serial_number
AND SRC.cdctype<>'D'
) temp;




