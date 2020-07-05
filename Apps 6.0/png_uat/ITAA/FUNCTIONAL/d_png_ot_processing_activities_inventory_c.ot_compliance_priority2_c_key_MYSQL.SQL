SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ot_compliance_priority2_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdwdb.d_png_ot_processing_activities_inventory_c a 
LEFT JOIN png_mdwdb.d_lov fin ON a.pii_data_type_final_formula_c_key=fin.row_key
WHERE 
COALESCE((SELECT max(row_key) from png_mdwdb.d_lov WHERE dimension_class 
IN('OT_COMPLIANCE_PRIORITIZATION_TWO_C~PROCESSING_ACTIVITIES') 
AND row_id =(CONCAT('OT_COMPLIANCE_PRIORITIZATION_TWO_C~PROCESSING_ACTIVITIES~',
CASE WHEN COALESCE(a.ot_risk_level,'UNSPECIFIED') ='High' 
AND COALESCE(fin.dimension_name,'UNSPECIFIED') ='High' THEN 'A'
WHEN COALESCE(fin.dimension_name,'UNSPECIFIED') ='High' THEN 'B'
WHEN COALESCE(fin.dimension_name,'UNSPECIFIED') ='Medium' THEN 'C'ELSE 'D' END))
),0) <> a.ot_compliance_priority2_c_key
AND a.soft_deleted_flag='N'
)

 