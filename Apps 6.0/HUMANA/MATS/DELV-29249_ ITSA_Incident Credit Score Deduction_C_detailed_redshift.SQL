/* Tables Accessed:
d_application
d_application_mdm
d_assignment_group_manager
d_business_service
d_configuration_item
d_configuration_item_mdm
d_incident
d_incident_priority
d_internal_contact_assigned_to
d_internal_organization_department
d_internal_organization_group
f_incident_credit_score_detail */





Select 'f_incident_credit_score_detail' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
UNION 
Select 'd_internal_organization_group' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key 
UNION 
Select 'd_assignment_group_manager' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key 
JOIN ldb.d_assignment_group_manager c ON b.assignment_group_manager_key=c.row_key 
UNION 
Select 'd_application' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_application b ON a.application_key=b.row_key
UNION 
Select 'd_configuration_item' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
UNION 
Select 'd_internal_organization_department' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_internal_organization_department b ON a.department_key=b.row_key
UNION 
Select 'd_internal_contact_assigned_to' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_internal_contact_assigned_to b ON a.assigned_to_key=b.row_key 
UNION 
Select 'd_incident' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
UNION 
Select 'd_incident_priority' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_incident_priority c ON b.priority_src_key=c.row_key 
UNION 
Select 'd_configuration_item_mdm' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
JOIN ldb.d_configuration_item_mdm c ON a.configuration_item_key=c.row_key 
UNION 
Select 'd_application_mdm' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_application b ON a.application_key=b.row_key
JOIN ldb.d_application_mdm c ON b.row_key=c.row_key 
UNION 
Select 'd_business_service' as Table_Name,Count(1)
From ldb.f_incident_credit_score_detail a 
JOIN ldb.d_business_service b ON a.business_service_key=b.row_key
