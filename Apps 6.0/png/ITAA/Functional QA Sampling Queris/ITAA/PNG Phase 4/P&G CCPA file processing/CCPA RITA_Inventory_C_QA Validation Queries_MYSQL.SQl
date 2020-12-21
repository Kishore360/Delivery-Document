

Select a.ADM,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Adverse_Event_Information,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;



Select a.Data_breach_response_Criteria,a.Data_breach_response_Status,a.Data_breach_response_Evidence,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Business_Process,a.Business_Process_Owner,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1,2;



Select a.California_relevancy,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Data_about_children_under_13,a.Data_about_teens_16_18_years_old,a.Data_about_teens_13_15_years_old,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1,2,3;


Select a.Country_collected,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Credit_Card_Numbers,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.custom_field_1,a.custom_field_2,a.custom_field_3,a.custom_field_10,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

DATA_Retension Attributes: 

Select a.Data_retention_Status,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Data_Retention_Criteria,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Data_Retention_Evidence,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.ID,a.Data_Retention_Evidence,a.Data_Retention_Criteria,a.Data_Retention_Evidence,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
wHERE a.ID IN ('119','100')
group by 1,2,3;


Select a.num_of_Data_Stakeholders_from_US,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Data_subject_type,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Digital_signature_data,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Function,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Genetic_data,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Precise_geolocation_data,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Government_ID,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Other_health_or_medical_data,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Identification_data,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Image_sound_recordings_156116006,a.Image_sound_recordings,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Reasonable_InfoSec_Criteria,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Reasonable_InfoSec_Evidence,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;

Select a.Title,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Inventory_Evidence,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
group by 1;


Select a.Last_reviewed_reviewer,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Legal_Entity,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Life_Cycle_Status,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;


Select a.Minimization_Status,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;


-- Notice_Evidence
-- Notice_Criteria
-- Notice_Status

Select a.Notice_Status,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;


Select a.Owning_Organization,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Owning_Organization_Grouping,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Personal_characteristics,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Political_opinions,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;



Select a.Profession,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;


Select a.Religious_or_philosophical_beliefs,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Remediation_GUV_Number,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;


Select a.Repository_Type,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.RoPA_linked_to_IT_Asset,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.SAP_Vendor_Number,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;



Select a.SAP_Vendor_Name,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Sex_life,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Site,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Trade_union_membership,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Unregistered_application_info,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Vendor_contact,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Vendor_involved,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.Vendor_qualification,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;

Select a.XLS_Template_ID,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;


-- Data_Subject_Rights_Evidence
-- Data_Subject_Rights_Criteria
-- Data_Subject_Rights_Status

Select a.Data_Subject_Rights_Status,
Count(distinct a.ID)
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a
WHERE a.cdctype='X'
group by 1;