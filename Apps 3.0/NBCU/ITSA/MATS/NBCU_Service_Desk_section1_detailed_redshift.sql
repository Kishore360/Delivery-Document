select'ldb.f_call' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 UNION
 select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
  join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
UNION
 select'd_master_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join        ldb.d_master_item         a13
                  on         (a11.master_item_key = a13.row_key)
UNION
select'd_call' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
 join        ldb.d_call             a14
                  on         (a11.call_key = a14.row_key)
UNION
select'dh_employee_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key) 
 join        ldb.dh_employee_hierarchy       a15
                  on         (a12.row_current_key = a15.lev_0_key)
UNION
				  
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
  join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
				  join        ldb.d_internal_contact_mdm     a16
                  on         (a12.row_current_key = a16.row_current_key)
UNION
 select'd_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
    join        ldb.d_internal_contact  a12
                  on         (a11.opened_by_key = a12.row_key)
  join        ldb.d_internal_contact_mdm     a16
                  on         (a12.row_current_key = a16.row_current_key)
  join        ldb.d_employee_location            a17
                  on         (a16.location_key = a17.row_key)
UNION
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
        join        ldb.d_calendar_date      a18
                  on         (a11.opened_on_key = a18.row_key)
UNION
select'd_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
 join        ldb.d_task           a19
                  on         (a11.task_key = a19.row_key)		
---				  
UNION
select'd_call_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
       join  ldb.d_call_reported_type            a110
                  on         (a11.reported_type_src_key = a110.row_key)
UNION
select'd_call_call_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
                join        ldb.d_call_call_type        a111
                  on         (a11.call_type_src_key = a111.row_key)				  
--
UNION
select'd_internal_contact_caller' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11       
                join        ldb.d_internal_contact_caller    a112
                  on         (a11.caller_key = a112.row_key)
UNION
select'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11 
                join        ldb.d_internal_organization_legalentity a113
                  on         (a11.company_key = a113.row_key)
--
UNION
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11
                                join        ldb.d_internal_organization_department             a114
                  on         (a11.department_key = a114.row_key)
UNION
select'd_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11              
                join        ldb.d_domain    a115
                  on         (a11.domain_key = a115.row_key)
				  UNION
				  select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_call             a11              
                  join        ldb.d_location   a116
                  on         (a11.location_key = a116.row_key)	