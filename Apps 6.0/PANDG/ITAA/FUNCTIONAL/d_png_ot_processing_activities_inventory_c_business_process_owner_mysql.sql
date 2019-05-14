--- DELV-16846

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.business_process_owner' ELSE 'SUCCESS' END as Message
FROM
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC 
LEFT JOIN png_mdsdb.pg_ot_user_list_c_final SRC1 ON SRC.Business_Process_Owner=SRC1.User_Id
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.inventory_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
CASE WHEN SRC1.User_Name IS NULL OR SRC1.User_Name ='' 
THEN 'UNSPECIFIED' ELSE SRC1.User_Name END<>TRGT.business_process_owner
AND SRC.cdctype='X';

) temp;