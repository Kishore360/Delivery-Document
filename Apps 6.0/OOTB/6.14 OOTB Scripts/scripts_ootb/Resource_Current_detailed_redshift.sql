select'ldb.d_project' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
 join ldb.d_project a12 
 on (a11.project_key=a12.row_key) 
 union
select'ldb.d_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
 join ldb.d_internal_contact a13 
 on (a11.resource_key=a13.row_key) 
 union
select'ldb.d_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
 join ldb.d_calendar_date a14 
 on (a11.planned_start_on_key=a14.row_key) 
 union
select'ldb.d_project_top_project' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
  join ldb.d_project a12 
 on (a11.project_key=a12.row_key) 
 join ldb.d_project_top_project a15 
 on (a12.top_project_key=a15.row_key) 
 union
select'ldb.d_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
 join ldb.d_internal_organization_group a16 
 on (a11.group_resource_key=a16.row_key) 
 union
select'ldb.d_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
 join ldb.d_internal_contact a13 
 on (a11.resource_key=a13.row_key) 
 join ldb.d_internal_contact_mdm a17 
 on (a13.row_current_key=a17.row_current_key) 
 union
select'ldb.d_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
 join ldb.d_calendar_date a14 
 on (a11.planned_start_on_key=a14.row_key)
 join ldb.d_calendar_month a18 
 on (a14.month_start_date_key=a18.row_key) 
 union
select'ldb.d_portfolio' as Table_Name,count(a11.row_key) Row_Count 
 from ldb.f_n_resource_current a11 
  join ldb.d_project a12 
 on (a11.project_key=a12.row_key) 
 join ldb.d_project_top_project a15 
 on (a12.top_project_key=a15.row_key) 
 join ldb.d_portfolio a19 
 on (a15.portfolio_key=a19.row_key);
