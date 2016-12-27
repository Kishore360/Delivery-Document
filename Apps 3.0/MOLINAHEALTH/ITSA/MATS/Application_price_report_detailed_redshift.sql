select 'ldb.f_applications_summary_c a11 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_calendar_date a13 
on (a11.week_end_date_key = a13.row_key) 
union
select 'ldb.d_business_service_c a14 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) 
left outer join ldb.d_business_service_c a14 
on (a12.row_current_key = a14.configuration_item_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) left outer join ldb.d_business_service_c a14 
on (a12.row_current_key = a14.configuration_item_key) 
left outer join ldb.d_business_service a15 
on (a14.row_key = a15.row_key) 
union
select 'ldb.dh_service_subservice_hierarchy_c a16 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) left outer join ldb.d_business_service_c a14 
on (a12.row_current_key = a14.configuration_item_key) left outer join ldb.d_business_service a15 
on (a14.row_key = a15.row_key) 
left outer join ldb.dh_service_subservice_hierarchy_c a16 
on (a15.row_current_key = a16.lev_0_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_calendar_date a13 
on (a11.week_end_date_key = a13.row_key) 
left outer join ldb.d_calendar_month a17 
on (a13.month_start_date_key = a17.row_key) 
union
select 'ldb.d_service_level1_c a18 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) left outer join ldb.d_business_service_c a14 
on (a12.row_current_key = a14.configuration_item_key) left outer join ldb.d_business_service a15 
on (a14.row_key = a15.row_key) left outer join ldb.dh_service_subservice_hierarchy_c a16 
on (a15.row_current_key = a16.lev_0_key) 
left outer join ldb.d_service_level1_c a18 
on (a16.lev_1_key = a18.row_key) 
union
select 'ldb.d_service_level2_c a19 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) left outer join ldb.d_business_service_c a14 
on (a12.row_current_key = a14.configuration_item_key) left outer join ldb.d_business_service a15 
on (a14.row_key = a15.row_key) left outer join ldb.dh_service_subservice_hierarchy_c a16 
on (a15.row_current_key = a16.lev_0_key) 
left outer join ldb.d_service_level2_c a19 
on (a16.lev_2_key = a19.row_key) 
union
select 'ldb.d_service_level3_c a110 ' as Table_name, count(a11.*) Row_Count
from ldb.f_applications_summary_c a11 
left outer join ldb.d_configuration_item a12 
on (a11.configuration_item_key = a12.row_key) left outer join ldb.d_business_service_c a14 
on (a12.row_current_key = a14.configuration_item_key) left outer join ldb.d_business_service a15 
on (a14.row_key = a15.row_key) left outer join ldb.dh_service_subservice_hierarchy_c a16 
on (a15.row_current_key = a16.lev_0_key) 
left outer join ldb.d_service_level3_c a110 
on (a16.lev_3_key = a110.row_key) 
