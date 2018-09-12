select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_to       a12
on (a11.to_assigned_to_key=a12.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_to       a12
on (a11.to_assignment_group_key=a12.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_from       a12
on (a11.from_assigned_to_key=a12.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_from       a12
on (a11.from_assigned_to_key=a12.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_from       a12
on (a11.from_assignment_group_key=a12.row_key)