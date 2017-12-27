select'f_incident_activity' as Table_Name, count(1) Row_Count
from  ldb.f_incident_activity              a11 
union
select'd_lov_incident_state_incident_activity_c ' as Table_Name, count(1) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_lov_incident_state_incident_activity_c          a12
on (a11.state_key = a12.row_key) 
union
select'd_internal_organization_incident_activity_c' as Table_Name, count(1) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_internal_organization_incident_activity_c         a12
on (a11.assignment_group_key = a12.row_key)
union
select'd_calendar_date_fiscal' as Table_Name, count(1) Row_Count
from  ldb.f_incident_activity              a11 
  join          ldb.d_calendar_date_fiscal    a14
                  on          (a11.opened_on_key = a14.row_key)
