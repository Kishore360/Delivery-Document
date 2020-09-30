GDPR_Compliance_Source to Target Query 

SELECT 'pg_ot_processing_activities_inventory_final',Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final a where a.cdctype='X' group by 1
UNION 
SELECT 'd_png_ot_processing_activities_inventory_c',Count(1) as CNT 
FROM png_mdwdb.d_png_ot_processing_activities_inventory_c a where a.soft_deleted_flag='N' group by 1
UNION
SELECT 'f_png_ot_processing_activities_inventory_c',Count(1) as CNT 
FROM png_mdwdb.f_png_ot_processing_activities_inventory_c a where a.soft_deleted_flag='N' group by 1
UNION
SELECT 'f_png_ot_processing_activity_validation_control_c',Count(1) as CNT 
FROM png_mdwdb.f_png_ot_processing_activity_validation_control_c a where a.soft_deleted_flag='N' group by 1


NA_ Compliance_Source to Target Query 

SELECT 'pg_ot_ccpa_pa_inventory_c_final',Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a where a.cdctype='X' group by 1
UNION 
SELECT 'd_png_ot_ccpa_numerita_c',Count(1) as CNT 
FROM png_mdwdb.d_png_ot_ccpa_numerita_c a where a.soft_deleted_flag='N' group by 1
UNION
SELECT 'f_png_ot_ccpa_numerita_c',Count(1) as CNT 
FROM png_mdwdb.f_png_ot_ccpa_numerita_c a where a.soft_deleted_flag='N' group by 1
UNION
SELECT 'f_png_ot_ccpa_validation_control_c',Count(1) as CNT 
FROM png_mdwdb.f_png_ot_ccpa_validation_control_c a where a.soft_deleted_flag='N' group by 1;


LA_ Compliance_Source to Target Query 

SELECT 'pg_ot_brazil_processing_activity_inventory_c_final',Count(1) as CNT 
FROM png_mdsdb.pg_ot_brazil_processing_activity_inventory_c_final a where a.cdctype='X' group by 1
UNION 
Select 'd_brazil_inventory_c',Count(1) as CNT 
FROM png_mdwdb.d_brazil_inventory_c a where a.soft_deleted_flag='N' group by 1
UNION 
Select 'f_brazil_inventory_c',Count(1) as CNT 
FROM png_mdwdb.f_brazil_inventory_c a where a.soft_deleted_flag='N' group by 1
UNION 
SELECT 'f_brazil_validation_control_c',Count(1) as CNT 
FROM png_mdwdb.f_brazil_validation_control_c a where a.soft_deleted_flag='N' group by 1

AMA_Compliane_Source to Target Query 

SELECT 'pg_ot_ama_processing_activity_inventory_c_final', Count(1) as CNT 
FROM png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final a where a.cdctype='X' group by 1
UNION 
SELECT 'd_ama_inventory_c', Count(1) as CNT 
FROM png_mdwdb.d_ama_inventory_c a where a.soft_deleted_flag='N' group by 1
UNION 
SELECT 'f_ama_inventory_c_fact', Count(1) as CNT 
FROM png_mdwdb.f_ama_inventory_c_fact a where a.soft_deleted_flag='N' group by 1
UNION 
SELECT 'f_ama_validation_control_c_fact',Count(1) as CNT
FROM png_mdwdb.f_ama_validation_control_c_fact a where a.soft_deleted_flag='N' group by 1;