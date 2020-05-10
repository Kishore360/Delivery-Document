SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.pii_data_type_final_formula_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM  
png_mdwdb.d_png_ot_processing_activities_inventory_c a13
LEFT JOIN png_mdwdb.d_lov vdr_ql ON a13.vendor_qualification_c_key = vdr_ql.row_key
LEFT JOIN 
(SELECT png_ot_inventory_c_key,SUBSTRING_INDEX(GROUP_CONCAT(tp.dimension_name order by tp.dimension_code asc separator '@' ),'@',1) 
as pii_data_type_formula
from png_mdwdb.f_png_ot_data_elements_collected_c a11
JOIN png_mdwdb.d_png_ot_data_elements_collected_c a12 ON a11.png_ot_data_elements_collected_c_key = a12.row_key
JOIN png_mdwdb.d_lov tp ON a12.pii_data_type_formula_c_key = tp.row_key
where a11.soft_deleted_flag='N'
GROUP BY 1
) dtyp ON a13.row_key= dtyp.png_ot_inventory_c_key
WHERE 
a13.pii_data_type_final_formula_c_key<> coalesce( (SELECT max(row_key) 
FROM png_mdwdb.d_lov WHERE dimension_class ='PII_DATA_TYPE_FINAL_FORMULA_C~PROCESSING_ACTIVITIES' 
AND row_id = (COALESCE(CONCAT('PII_DATA_TYPE_FINAL_FORMULA_C~PROCESSING_ACTIVITIES~',IF(a13.pii_handled_flag in('Yes','UNSPECIFIED'),
IF(vdr_ql.dimension_name = 'Data Controller','N/A',dtyp.pii_data_type_formula),'N/A')),
'PII_DATA_TYPE_FINAL_FORMULA_C~PROCESSING_ACTIVITIES~NOT SCORED')
)),0)

) temp;


