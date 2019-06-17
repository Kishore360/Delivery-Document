
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_location.region_name_c' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmn_location_final SRC1 ON SRC.location=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_location LKP ON SRC.location=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(SRC1.u_pg_region,'UNSPECIFIED')<>LKP.region_name_c
AND SRC.cdctype<>'D'
) temp;



 