 select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 union
 select'd_change_request_change_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_change_request_change_c         a12
on (a11.change_c_key = a12.row_key)
 union
 select'd_internal_contact_facilitator_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_facilitator_c         a12
on (a11.it_incident_facilitator_c_key = a12.row_key)
 union
 select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_manager_c         a12
on (a11.incident_manager_c_key = a12.row_key)
 union
 select'd_internal_contact_communications_lead_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_communications_lead_c         a12
on (a11.communications_lead_c_key = a12.row_key)
 union
 select'd_internal_contact_service_owner_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_service_owner_c         a12
on (a11.service_owner_c_key = a12.row_key)
 union
 select'd_internal_contact_communications_advisor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_contact_communications_advisor_c         a12
on (a11.communications_advisor_c_key = a12.row_key)
 union
 select'd_internal_organization_gp_assignment_teams_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
join ldb.d_internal_organization_gp_assignment_teams_c         a12
on (a11.assignment_teams_c_key = a12.row_key)