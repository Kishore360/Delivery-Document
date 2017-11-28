-- d_configuration_item
-- d_hdi_survey_response_c
-- d_incident
-- d_internal_contact_agent1_c
-- d_internal_contact_agent2_c
-- d_internal_contact_customer_c
-- d_internal_organization_group
-- d_location
-- dh_user_group_hierarchy
-- dh_user_group_level1
-- f_hdi_survey_response_c 




SELECT 'f_hdi_survey_response_c' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
UNION 
SELECT 'dh_user_group_level1' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_organization_group b ON a.minor_organization_c_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
JOIN ldb.dh_user_group_level1 d ON c.lev_1_key=d.row_key
UNION 
SELECT 'dh_user_group_hierarchy' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_organization_group b ON a.minor_organization_c_key=b.row_key
JOIN ldb.dh_user_group_hierarchy c ON b.row_dn_key=c.lev_0_key
UNION 
SELECT 'd_location' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_internal_organization_group_Minor' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_organization_group b ON a.minor_organization_c_key=b.row_key
UNION 
SELECT 'd_internal_organization_group_Major' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_organization_group b ON a.major_organization_c_key=b.row_key
UNION 
SELECT 'd_internal_contact_customer_c' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_contact_customer_c b ON a.orgsub_contact_type_c_key=b.row_key
UNION 
SELECT 'd_internal_contact_agent2_c' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_contact_agent2_c b ON a.agent2_c_key=b.row_key
UNION 
SELECT 'd_internal_contact_agent1_c' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_internal_contact_agent1_c b ON a.agent1_c_key=b.row_key
UNION 
SELECT 'd_incident' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION 
SELECT 'd_hdi_survey_response_c' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_hdi_survey_response_c b  ON a.hdi_survey_response_c_key=b.row_key
UNION 
SELECT 'd_configuration_item' as Table_Name,Count(a.row_key) as Row_Count
FROM ldb.f_hdi_survey_response_c a 
JOIN ldb.d_configuration_item b  ON a.configuration_item_key=b.row_key