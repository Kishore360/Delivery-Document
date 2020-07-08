SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_site_mapping_c.cmdb_site_name_c' ELSE 'SUCCESS' END as Message
FROM
(
 
 SELECT Count(1) as CNT 
 FROM png_mdsdb.us_site_mapping_c_final SRC 
 LEFT JOIN png_mdwdb.d_site_mapping_c TRGT ON SRC.CMDB_Site_Name=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
 WHERE COALESCE(SRC.CMDB_Site_Name,'UNSPECIFIED') <> TRGT.cmdb_site_name_c
 AND SRC.cdctype='X'
) temp;



