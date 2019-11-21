SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.data stake holders' ELSE 'SUCCESS data stake holders' END as Message 
FROM  
(
select  count(1) as CNT  FROM 
 png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_DATA_STAKEHOLDERS~PROCESSING_ACTIVITIES~',
src.num_of_Data_Stakeholders_from_US),'UNSPECIFIED') = lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.num_of_Data_Stakeholders_from_US IS NULL THEN 0 else -1 end)<> trgt.ot_ccpa_data_stakeholders_c_key
)temp; 


 