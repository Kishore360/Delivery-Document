SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.country_collected_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  png_mdwdb.d_png_ot_ccpa_numerita_c trgt on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.Country_Collected IS NULL or src.Country_Collected = ''
then 'UNSPECIFIED'  else src.Country_Collected end <> trgt.country_collected_c
AND src.cdctype='X'
) temp;




