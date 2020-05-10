SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.family_comp' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c trgt on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
where 
case when src.Data_Elements_Collected_PG like '%Family composition%' then 'TRUE'  else 'FALSE' end <> trgt.family_comp
and src.cdctype='X'
) temp;
