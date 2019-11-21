SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.data_subject_type_c_key' ELSE 'SUCCESS data_subject_type_c_key' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_DATA_SUBJECT_TYPE_PG_C~PROCESSING_ACTIVITIES~',src.Data_Subject_Type),'UNSPECIFIED')=lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Data_Subject_Type IS NULL THEN 0 else -1 end)<> trgt.data_subject_type_c_key
) temp;


