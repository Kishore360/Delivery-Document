SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_fnms_reports_c.cores_number_c' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT Count(1) as CNT 
 FROM png_mdsdb.us_fnms_reports_final SRC 
 LEFT JOIN png_mdwdb.d_fnms_reports_c TRGT ON CONCAT(SRC.Serial_no,'~' , SRC.Inventory_device_name)=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id
 WHERE COALESCE(SRC.Cores_number,'UNSPECIFIED')<>TRGT.cores_number_c
 AND SRC.cdctype='X'
) temp;


