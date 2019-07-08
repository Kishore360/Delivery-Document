select 'ldb.f_work_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.work_item_assigned_to_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key_c = a14.row_key) 
union
select 'ldb.d_work_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
union
select 'ldb.d_work_item_epic a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_epic a16 
on (a15.work_item_epic_key = a16.row_key) 
union
select 'ldb.d_work_item_initiative_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) join ldb.d_work_item_epic a16 
on (a15.work_item_epic_key = a16.row_key) 
join ldb.d_work_item_initiative_c a17 
on (a16.work_item_initiative_c_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) 
union
select 'ldb.d_calendar_month a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) 
join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) 
union
select 'ldb.d_calendar_quarter a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) 
join ldb.d_calendar_quarter a110 
on (a19.quarter_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key_c = a14.row_key) 
join ldb.d_calendar_fiscal_quarter a111 
on (a14.quarter_start_date_key = a111.row_key) 
union
select 'ldb.d_calendar_fiscal_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.fiscal_date_key_c = a14.row_key) 
join ldb.d_calendar_fiscal_year a112 
on (a14.year_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) join ldb.d_calendar_month a19 
on (a18.month_start_date_key = a19.row_key) join ldb.d_calendar_quarter a110 
on (a19.quarter_start_date_key = a110.row_key) 
join ldb.d_calendar_year a113 
on (a110.year_start_date_key = a113.row_key) 
union
select 'ldb.d_iteration a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_iteration a114 
on (a15.iteration_key = a114.row_key) 
union
select 'ldb.d_project a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_project a115 
on (a11.project_key = a115.row_key) 
union
select 'ldb.d_work_item_earliest_fixed_version a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_earliest_fixed_version a116 
on (a15.earliest_fixed_version_key = a116.row_key) 
union
select 'ldb.d_work_item_status a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_status a117 
on (a15.work_item_status_src_key = a117.row_key) 
union
select 'ldb.d_internal_contact_assigned_to_mdm_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.work_item_assigned_to_key = a12.row_key) 
join ldb.d_internal_contact_assigned_to_mdm_c a118 
on (a12.assigned_to_mdm_key_c = a118.row_key) 
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a13.employee_mdm_key = a119.row_key) 
union
select 'ldb.d_calendar_week a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_calendar_date a18 
on (a11.date_key = a18.row_key) 
join ldb.d_calendar_week a120 
on (a18.week_start_date_key = a120.row_key) 
union
select 'ldb.d_project_category a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_project a115 
on (a11.project_key = a115.row_key) 
join ldb.d_project_category a121 
on (a115.project_category_src_key = a121.row_key) 
union
select 'ldb.d_project_classification a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_project a115 
on (a11.project_key = a115.row_key) 
join ldb.d_project_classification a122 
on (a115.project_classification_src_key = a122.row_key) 
union
select 'ldb.d_work_item_closed_by a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_closed_by a123 
on (a15.work_item_closed_by_key = a123.row_key) 
union
select 'ldb.d_work_item_created_by a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_created_by a124 
on (a15.created_by_key = a124.row_key) 
union
select 'ldb.d_primary_component a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_primary_component a125 
on (a15.primary_component_key = a125.row_key) 
union
select 'ldb.d_work_item_priority a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_priority a126 
on (a15.work_item_priority_src_key = a126.row_key) 
union
select 'ldb.d_work_item_reported_by a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_reported_by a127 
on (a15.work_item_reported_by_key = a127.row_key) 
union
select 'ldb.d_work_item_resolution a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_resolution a128 
on (a15.work_item_resolution_src_key = a128.row_key) 
union
select 'ldb.d_work_item_resolved_by a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_resolved_by a129 
on (a15.work_item_resolved_by_key = a129.row_key) 
union
select 'ldb.d_work_item_status_category a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_status_category a130 
on (a15.work_item_status_category_src_key = a130.row_key) 
union
select 'ldb.d_work_item_type a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_type a131 
on (a15.work_item_type_src_key = a131.row_key) 
union
select 'ldb.d_work_item_updated_by a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) 
join ldb.d_work_item_updated_by a132 
on (a15.work_item_updated_by_key = a132.row_key) 
union
select 'ldb.d_initiative_business_value_category_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) join ldb.d_work_item_epic a16 
on (a15.work_item_epic_key = a16.row_key) join ldb.d_work_item_initiative_c a17 
on (a16.work_item_initiative_c_key = a17.row_key) 
join ldb.d_initiative_business_value_category_c a133 
on (a17.initiative_business_value_category_key_c = a133.row_key) 
union
select 'ldb.d_initiative_health_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) join ldb.d_work_item_epic a16 
on (a15.work_item_epic_key = a16.row_key) join ldb.d_work_item_initiative_c a17 
on (a16.work_item_initiative_c_key = a17.row_key) 
join ldb.d_initiative_health_c a134 
on (a17.initiative_health_key_c = a134.row_key) 
union
select 'ldb.d_initiative_methdology_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) join ldb.d_work_item_epic a16 
on (a15.work_item_epic_key = a16.row_key) join ldb.d_work_item_initiative_c a17 
on (a16.work_item_initiative_c_key = a17.row_key) 
join ldb.d_initiative_methdology_c a135 
on (a17.initiative_methdology_key_c = a135.row_key) 
union
select 'ldb.d_initiative_size_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_work_item a11 
join ldb.d_work_item a15 
on (a11.work_item_key = a15.row_key) join ldb.d_work_item_epic a16 
on (a15.work_item_epic_key = a16.row_key) join ldb.d_work_item_initiative_c a17 
on (a16.work_item_initiative_c_key = a17.row_key) 
join ldb.d_initiative_size_c a136 
on (a17.initiative_size_key_c = a136.row_key) 

