select 'ldb.f_time_card a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
union
select 'ldb.d_portfolio_level_0_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_portfolio_level_0_c a13 
on (a12.portfolio_levels_c_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_calendar_date a14 
on (a11.timecard_on_key = a14.row_key) 
union
select 'ldb.d_internal_organization_department a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_organization_department a15 
on (a11.department_key = a15.row_key) 
union
select 'ldb.d_internal_contact_mdm a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_mdm a16 
on (a12.row_current_key = a16.row_current_key) 
union
select 'ldb.d_location a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_location a17 
on (a11.location_key = a17.row_key) 
union
select 'ldb.d_project a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_project a18 
on (a11.project_key = a18.row_key) 
union
select 'ldb.d_time_card_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_time_card_state a19 
on (a11.state_src_key = a19.row_key) 
union
select 'ldb.d_time_sheet_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_time_sheet_c a110 
on (a11.time_sheet_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_time_sheet_approver_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact_time_sheet_approver_c a111 
on (a11.time_sheet_approver_user_c_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_calendar_date a14 
on (a11.timecard_on_key = a14.row_key) 
join ldb.d_calendar_month a112 
on (a14.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_calendar_date a14 
on (a11.timecard_on_key = a14.row_key) 
join ldb.d_calendar_week a113 
on (a14.week_start_date_key = a113.row_key) 
union
select 'ldb.d_internal_contact_employee_manager_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) 
join ldb.d_internal_contact_employee_manager_c a114 
on (a12.manager_key = a114.row_key) 
union
select 'ldb.d_calendar_quarter a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_calendar_date a14 
on (a11.timecard_on_key = a14.row_key) 
join ldb.d_calendar_quarter a115 
on (a14.quarter_start_date_key = a115.row_key) 
union
select 'ldb.d_portfolio_level_1_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) join ldb.d_portfolio_level_0_c a13 
on (a12.portfolio_levels_c_key = a13.row_key) 
join ldb.d_portfolio_level_1_c a116 
on (a13.level_1_code = a116.level_1_code_c) 
union
select 'ldb.d_calendar_year a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_calendar_date a14 
on (a11.timecard_on_key = a14.row_key) 
join ldb.d_calendar_year a117 
on (a14.year_start_date_key = a117.row_key) 
union
select 'ldb.d_portfolio_level_2_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) join ldb.d_portfolio_level_0_c a13 
on (a12.portfolio_levels_c_key = a13.row_key) 
join ldb.d_portfolio_level_2_c a118 
on (a13.level_2_code = a118.level_2_code_c) 
union
select 'ldb.d_portfolio_level_3_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) join ldb.d_portfolio_level_0_c a13 
on (a12.portfolio_levels_c_key = a13.row_key) 
join ldb.d_portfolio_level_3_c a119 
on (a13.level_3_code = a119.level_3_code_c) 
union
select 'ldb.d_portfolio_level_4_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_time_card a11 
join ldb.d_internal_contact a12 
on (a11.employee_key = a12.row_key) join ldb.d_portfolio_level_0_c a13 
on (a12.portfolio_levels_c_key = a13.row_key) 
join ldb.d_portfolio_level_4_c a120 
on (a13.level_4_code = a120.level_4_code_c) 
