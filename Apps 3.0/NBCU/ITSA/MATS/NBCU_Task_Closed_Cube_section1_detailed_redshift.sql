select 'ldb.f_task_c_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.dh_user_group_hierarchy a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
join ldb.dh_user_group_hierarchy a14 
on (a13.row_dn_key = a14.lev_0_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_calendar_date a15 
on (a11.closed_on_key = a15.row_key) 
union
select 'ldb.d_task_ra_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_task_ra_c a16 
on (a11.task_key = a16.row_key) 
union
select 'ldb.d_master_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_master_item a17 
on (a11.catalog_item_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_internal_contact a12 
on (a11.closed_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a110 
on (a12.row_current_key = a110.row_current_key) 
union
select 'ldb.d_lov_source_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_lov_source_c a111 
on (a11.source_src_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_task_opened_by_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_internal_contact_task_opened_by_c a112 
on (a11.closed_by_key = a112.row_key) 
union
select 'ldb.d_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_task_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_task_contacttype a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_task_contacttype a114 
on (a11.contact_type_src_c_key = a114.row_key) 
union
select 'ldb.d_task_state_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_c_closed a11 
join ldb.d_task_state_c a115 
on (a11.state_src_key = a115.row_key) 
UNION 
SELECT 'd_location' AS Table_Name,count(a.row_key) AS Row_count
FROM ldb.f_task_c_closed a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_lov_task_closure_code_c' AS Table_Name,count(a.row_key) AS Row_count
FROM ldb.f_task_c_closed a 
JOIN ldb.d_lov_task_closure_code_c b ON a.closure_code_src_c_key=b.row_key
UNION 
SELECT 'd_task_parent_c' AS Table_Name,Count(a.row_key) AS Row_Count
FROM ldb.f_task_c_closed a 
JOIN ldb.d_task_ra_c b ON a.task_key=b.row_key
JOIN ldb.d_task_parent_c c ON b.parent_task_key=c.row_key