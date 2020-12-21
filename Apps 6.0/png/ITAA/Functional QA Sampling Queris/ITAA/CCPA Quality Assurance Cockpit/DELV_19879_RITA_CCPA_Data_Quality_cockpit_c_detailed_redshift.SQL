SELECT 'f_png_ot_ccpa_numerita_c' AS Table_Name,Count(1) as Row_Count 
FROM ldb.f_png_ot_ccpa_numerita_c a 
UNION 
SELECT 'd_png_ccpa_processing_activities_inventory_c' as Table_Name,Count(1) as CNT 
FROM ldb.d_png_ccpa_processing_activities_inventory_c a
UNION 
SELECT 'd_lov_ccpa_processing_activities_data_subject_type_c' as Table_Name,Count(1) as CNT 
FROM ldb.d_png_ccpa_processing_activities_inventory_c a
JOIN ldb.d_lov_ccpa_processing_activities_data_subject_type_c b ON a.data_subject_type_c_key=b.row_key 
UNION 
SELECT 'd_lov_ccpa_processing_activities_ot_life_cycle_status_c' as Table_Name,Count(1) as CNT 
FROM ldb.d_png_ccpa_processing_activities_inventory_c a
JOIN ldb.d_lov_ccpa_processing_activities_ot_life_cycle_status_c b ON a.ot_ccpa_life_cycle_status_c=b.row_key 
UNION 
SELECT 'd_processing_activities_ccpa_owning_organization_c' as Table_Name,Count(1) as CNT 
FROM ldb.d_png_ccpa_processing_activities_inventory_c a
JOIN ldb.d_processing_activities_ccpa_owning_organization_c b ON a.ccpa_owning_organization_c_key=b.row_key 





