SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.dig_sign_data' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where 
case when src.Data_Elements_Collected_PG like '%Digital signature data%' then 'TRUE'  else 'FALSE' end <> trgt.dig_sign_data
AND src.cdctype='X'
) temp;