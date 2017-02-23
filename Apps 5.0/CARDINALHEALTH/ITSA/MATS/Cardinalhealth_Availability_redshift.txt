select 'ldb.f_application_availability_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.availability_start_on_key = a13.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.availability_start_on_key = a13.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_date a15 
on (a11.availability_start_on_key = a15.row_key) 
union
select 'ldb.d_internal_contact_business_owner_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_internal_contact_business_owner_c a16 
on (a12.business_contacts_c_key = a16.row_key) 
union
select 'ldb.d_config_item_cah_business_process_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_business_process_c a17 
on (a12.cah_business_process_src_c_key = a17.row_key) 
union
select 'ldb.d_config_item_cah_bus_criticl_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_bus_criticl_c a18 
on (a12.cah_bus_criticl_src_code_c_key = a18.row_key) 
union
select 'ldb.d_config_item_cah_bus_segment_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_bus_segment_c a19 
on (a12.cah_bus_segment_src_code_c_key = a19.row_key) 
union
select 'ldb.d_config_item_cah_bus_unit_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_bus_unit_c a110 
on (a12.cah_bus_unit_src_code_c_key = a110.row_key) 
union
select 'ldb.d_config_item_level_2_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_level_2_c a111 
on (a12.cah_support_grp_src_code_c_key = a111.row_key) 
union
select 'ldb.d_config_item_sla_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_sla_c a112 
on (a12.sla_src_c_key = a112.row_key) 
union
select 'ldb.d_config_item_cah_health_hardware_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_health_hardware_c a113 
on (a12.cah_health_hardware_src_c_key = a113.row_key) 
union
select 'ldb.d_internal_contact_level_3_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_internal_contact_level_3_c a114 
on (a12.eit_sup_leader_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_level_4_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_internal_contact_level_4_c a115 
on (a12.cah_level_4_c_key = a115.row_key) 
union
select 'ldb.d_internal_contact_level_5_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_internal_contact_level_5_c a116 
on (a12.cah_level_5_c_key = a116.row_key) 
union
select 'ldb.d_schedule_configuration_item_maintenance_schedule_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_schedule_configuration_item_maintenance_schedule_c a117 
on (a12.maintenance_schedule_c_key = a117.row_key) 
union
select 'ldb.d_calendar_month a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_date a15 
on (a11.availability_start_on_key = a15.row_key) 
join ldb.d_calendar_month a118 
on (a15.month_start_date_key = a118.row_key) 
union
select 'ldb.d_config_item_cah_health_overall_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_health_overall_c a119 
on (a12.cah_health_overall_src_c_key = a119.row_key) 
union
select 'ldb.d_schedule_configuration_item_schedule_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_schedule_configuration_item_schedule_c a120 
on (a12.schedule_c_key = a120.row_key) 
union
select 'ldb.d_config_item_cah_health_software_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
join ldb.d_config_item_cah_health_software_c a121 
on (a12.cah_health_software_src_c_key = a121.row_key) 
union
select 'ldb.d_calendar_fiscal_period a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.availability_start_on_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_period a122 
on (a14.period_start_date_key = a122.row_key) 
union
select 'ldb.d_calendar_fiscal_year a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_application_availability_c a11 
join ldb.d_calendar_greg_fiscal_c a13 
on (a11.availability_start_on_key = a13.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a14 
on (a13.fiscal_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a123 
on (a14.year_start_date_key = a123.row_key) 