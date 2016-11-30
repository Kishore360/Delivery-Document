select 'ldb.f_time_entry a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
union
select 'ldb.d_calendar_greg_fiscal_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_calendar_greg_fiscal_c a12 
on (a11.date_key = a12.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_calendar_greg_fiscal_c a12 
on (a11.date_key = a12.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a13 
on (a12.fiscal_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_calendar_date a14 
on (a11.date_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) 
union
select 'ldb.d_internal_contact_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) 
join ldb.d_internal_contact_mdm a16 
on (a15.row_current_key = a16.row_current_key) 
union
select 'ldb.d_project a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
union
select 'ldb.d_internal_contact_it_director_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_internal_contact_it_director_c a18 
on (a17.it_director_c_key = a18.it_director_c_key) 
union
select 'ldb.dh_employee_hierarchy a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) 
join ldb.dh_employee_hierarchy a19 
on (a15.row_current_key = a19.lev_0_key) 
union
select 'ldb.d_portfolio_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_portfolio_c a110 
on (a17.portfolio_key = a110.row_key) 
union
select 'ldb.d_internal_contact a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_internal_contact a111 
on (a17.manager_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_internal_contact a112 
on (a17.requestor_c_key = a112.row_key) 
union
select 'ldb.d_internal_contact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_internal_contact a113 
on (a17.sponsor_c_key = a113.row_key) 
union
select 'ldb.d_task a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_task a114 
on (a11.task_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_calendar_fiscal_period a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_calendar_greg_fiscal_c a12 
on (a11.date_key = a12.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a13 
on (a12.fiscal_key = a13.row_key) 
join ldb.d_calendar_fiscal_period a116 
on (a13.period_start_date_key = a116.row_key) 
union
select 'ldb.d_time_card_category a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_time_card_category a117 
on (a11.category_src_key = a117.row_key) 
union
select 'ldb.d_time_card_charge_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_time_card_charge_type a118 
on (a11.charge_type_key = a118.row_key) 
union
select 'ldb.d_time_card_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_time_card_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_cost_center a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_cost_center a120 
on (a17.cost_center_c_key = a120.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_calendar_greg_fiscal_c a12 
on (a11.date_key = a12.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a13 
on (a12.fiscal_key = a13.row_key) 
join ldb.d_calendar_fiscal_quarter a121 
on (a13.quarter_start_date_key = a121.row_key) 
union
select 'ldb.d_project_division a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_project_division a122 
on (a17.division_src_c_key = a122.row_key) 
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) join ldb.d_internal_contact a111 
on (a17.manager_c_key = a111.row_key) 
join ldb.d_internal_contact_mdm a123 
on (a111.row_current_key = a123.row_key) 
union
select 'ldb.d_project_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_project_priority a124 
on (a17.project_priority_src_key = a124.row_key) 
union
select 'ldb.d_project_stage a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_project_stage a125 
on (a17.project_phase_src_key = a125.row_key) 
union
select 'ldb.d_project_state a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) 
join ldb.d_project_state a126 
on (a17.project_state_src_key = a126.row_key) 
union
select 'ldb.d_internal_contact_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) join ldb.d_internal_contact a112 
on (a17.requestor_c_key = a112.row_key) 
join ldb.d_internal_contact_mdm a127 
on (a112.row_current_key = a127.row_key) 
union
select 'ldb.d_internal_contact_mdm a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) join ldb.d_internal_contact a113 
on (a17.sponsor_c_key = a113.row_key) 
join ldb.d_internal_contact_mdm a128 
on (a113.row_current_key = a128.row_key) 
union
select 'ldb.d_internal_organization_legalentity a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.d_internal_contact_mdm a16 
on (a15.row_current_key = a16.row_current_key) 
join ldb.d_internal_organization_legalentity a129 
on (a16.company_c_key = a129.row_key) 
union
select 'ldb.d_internal_organization_department a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.d_internal_contact_mdm a16 
on (a15.row_current_key = a16.row_current_key) 
join ldb.d_internal_organization_department a130 
on (a16.department_c_key = a130.row_key) 
union
select 'ldb.d_calendar_fiscal_year a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_calendar_greg_fiscal_c a12 
on (a11.date_key = a12.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a13 
on (a12.fiscal_key = a13.row_key) 
join ldb.d_calendar_fiscal_year a131 
on (a13.year_start_date_key = a131.row_key) 
union
select 'ldb.d_portfolio_owner_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_project a17 
on (a11.project_key = a17.row_key) join ldb.d_portfolio_c a110 
on (a17.portfolio_key = a110.row_key) 
join ldb.d_portfolio_owner_c a132 
on (a110.portfolio_owner_key = a132.row_key) 
union
select 'ldb.dh_employee_level1 a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.dh_employee_hierarchy a19 
on (a15.row_current_key = a19.lev_0_key) 
join ldb.dh_employee_level1 a133 
on (a19.lev_1_key = a133.row_key) 
union
select 'ldb.dh_employee_level2 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.dh_employee_hierarchy a19 
on (a15.row_current_key = a19.lev_0_key) 
join ldb.dh_employee_level2 a134 
on (a19.lev_2_key = a134.row_key) 
union
select 'ldb.dh_employee_level3 a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.dh_employee_hierarchy a19 
on (a15.row_current_key = a19.lev_0_key) 
join ldb.dh_employee_level3 a135 
on (a19.lev_3_key = a135.row_key) 
union
select 'ldb.dh_employee_level4 a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.dh_employee_hierarchy a19 
on (a15.row_current_key = a19.lev_0_key) 
join ldb.dh_employee_level4 a136 
on (a19.lev_4_key = a136.row_key) 
union
select 'ldb.dh_employee_level5 a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_entry a11 
join ldb.d_internal_contact a15 
on (a11.user_key = a15.row_key) join ldb.dh_employee_hierarchy a19 
on (a15.row_current_key = a19.lev_0_key) 
join ldb.dh_employee_level5 a137 
on (a19.lev_5_key = a137.row_key) 

 