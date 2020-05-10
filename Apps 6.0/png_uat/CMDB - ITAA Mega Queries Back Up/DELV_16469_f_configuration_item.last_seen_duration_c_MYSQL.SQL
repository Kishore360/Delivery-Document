SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_configuration_item.last_seen_duration_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.f_configuration_item FAC ON SRC.sys_id=FAC.row_id AND SRC.sourceinstance=FAC.source_id
LEFT JOIN (SELECT source_id,MAX(lastupdated) as lastupdated FROM png_mdwdb.d_o_data_freshness group by source_id) ODF 
ON FAC.source_id=ODF.source_id
WHERE 
TIMESTAMPDIFF(SECOND,CONVERT_TZ(SRC.last_discovered,'GMT','America/New_York'),ODF.lastupdated)<>FAC.last_seen_duration_c
AND SRC.cdctype<>'D'
) temp;



