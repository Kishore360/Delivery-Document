
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c.next_review_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdwdb.d_png_ot_processing_activities_inventory_ext_c  TRGTF
LEFT JOIN png_mdwdb.d_png_ot_processing_activities_inventory_c TRGT ON TRGT.activities_inventory_ext_c_key=TRGTF.row_key
LEFT JOIN png_mdwdb.d_lov LKP ON TRGT.pii_data_type_final_formula_c_key=LKP.row_key
WHERE 
(CASE WHEN LKP.dimension_name IN ('HIGH','MEDIUM') 
THEN DATE_ADD(COALESCE(CASE WHEN TRGT.last_reviewed_date > now() THEN TRGT.created_on ELSE TRGT.last_reviewed_date END,TRGT.created_on), interval 365 day)
ELSE DATE_ADD(COALESCE(CASE WHEN TRGT.last_reviewed_date > now() THEN TRGT.created_on ELSE TRGT.last_reviewed_date END,TRGT.created_on),interval 730 day)
END)<>TRGTF.next_review_date_c
) temp;


