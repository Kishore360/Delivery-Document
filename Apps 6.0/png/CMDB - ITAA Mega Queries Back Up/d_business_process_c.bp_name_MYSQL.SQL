SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_business_process_c.bp_name' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_snv_app_assoc_business_process_final SRC 
LEFT JOIN png_mdwdb.d_business_process_c TRGT ON SRC.BP_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.BP_NAME,'UNSPECIFIED')<>TRGT.bp_name
AND SRC.cdctype='X'
)temp;


 
   