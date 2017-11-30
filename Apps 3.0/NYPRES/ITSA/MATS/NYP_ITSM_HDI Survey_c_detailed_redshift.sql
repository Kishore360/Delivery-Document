select 'ldb.f_hdi_survey_response_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
union
select 'ldb.d_hdi_survey_response_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_hdi_survey_response_c a12 
on (a11.hdi_survey_response_c_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_internal_organization_group a14 
on (a11.minor_organization_c_key = a14.row_key) 
union
select 'ldb.dh_user_group_hierarchy a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_internal_organization_group a14 
on (a11.minor_organization_c_key = a14.row_key) 
join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_internal_contact_customer_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_internal_contact_customer_c a17 
on (a11.minor_organization_c_key = a17.row_key) 
union
select 'ldb.d_lov_incident_category_hdi_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_lov_incident_category_hdi_c a18 
on (a11.catmaj_category_c_key = a18.row_key) 
union
select 'ldb.d_lov_incident_contacttype_orgsub_hdi_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_lov_incident_contacttype_orgsub_hdi_c a19 
on (a11.orgsub_contact_type_c_key = a19.row_key) 
union
select 'ldb.d_lov_incident_subcategory_hdi_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_lov_incident_subcategory_hdi_c a110 
on (a11.catmin_subcategory_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_agent1_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_internal_contact_agent1_c a111 
on (a11.agent1_c_key = a111.row_key) 
union
select 'ldb.d_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_location a112 
on (a11.location_key = a112.row_key) 
union
select 'ldb.d_internal_contact_agent2_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_internal_contact_agent2_c a113 
on (a11.agent2_c_key = a113.row_key) 
union
select 'ldb.dh_user_group_level1 a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_hdi_survey_response_c a11 
join ldb.d_internal_organization_group a14 
on (a11.minor_organization_c_key = a14.row_key) join ldb.dh_user_group_hierarchy a15 
on (a14.row_dn_key = a15.lev_0_key) 
join ldb.dh_user_group_level1 a114 
on (a15.lev_1_key = a114.row_key) 
