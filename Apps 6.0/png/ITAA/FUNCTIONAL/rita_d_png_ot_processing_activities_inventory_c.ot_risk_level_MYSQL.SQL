SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ot_risk_level' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  SRC
LEFT JOIN  png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON SRC.Inventory_Id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(CASE WHEN SRC.num_of_Data_Stakeholders_from_EU ='>= 20,000' 
-- OR SRC.Volumes_of_Records_All_Countries = '>= 1,000,000' removed as part of DELV-20031.  
THEN 'HIGH'
WHEN SRC.num_of_Data_Stakeholders_from_EU = '>= 1,000 - < 20,000' THEN 'MEDIUM'
ELSE 'LOW' END)<>TRGT.ot_risk_level
) temp;


