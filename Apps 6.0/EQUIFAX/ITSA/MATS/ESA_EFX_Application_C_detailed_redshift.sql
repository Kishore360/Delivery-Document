select 'ldb.f_efx_application_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_efx_application_c a11 
union
select 'ldb.d_efx_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_efx_application_c a11 
 join ldb.d_efx_application_c a12 
 on (a11.application_c_key = a12.row_key)  
union
select 'ldb.d_internal_organization_unit_l1_c a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_efx_application_c a11 
 join ldb.d_efx_application_c a12 
 on (a11.application_c_key = a12.row_key) 
 join ldb.d_internal_organization_unit_l1_c a13 
 on (a12.efx_organization_unit_l1_c_key = a13.row_key)  
union
select 'ldb.d_internal_contact_questionnaire_submitted_by_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_efx_application_c a11 
 join ldb.d_efx_application_c a12 
 on (a11.application_c_key = a12.row_key) 
 join ldb.d_internal_contact_questionnaire_submitted_by_c a14 
 on (a12.questionnaire_submitted_by_c_key = a14.row_key)  

