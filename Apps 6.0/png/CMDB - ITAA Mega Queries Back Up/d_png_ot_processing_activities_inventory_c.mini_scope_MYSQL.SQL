SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.mini_scope' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  if( (COALESCE(SRC.PII_Handled,'XX') ='No') OR (COALESCE(SRC.Vendor_Qualification,'UNSPECIFIED') ='Data Controller' 
 AND COALESCE(SRC.SAP_Vendor_Number,'UNSPECIFIED') not like '%no vendor%'), 'FALSE','TRUE')<>TRGT.mini_scope
AND SRC.cdctype='X'
)temp;




 
