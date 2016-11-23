select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_request_item_variable_audio_issue_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_audio_issue_c a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_request_item_variable_calendar_issue_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_calendar_issue_c a16 
on (a11.request_item_key = a16.row_key) 
union
select 'ldb.d_request_item_variable_camera_issue_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_camera_issue_c a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_request_item_variable_content_issue_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_content_issue_c a18 
on (a11.request_item_key = a18.row_key) 
union
select 'ldb.d_request_item_variable_monitor_issue_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_monitor_issue_c a19 
on (a11.request_item_key = a19.row_key) 
union
select 'ldb.d_request_item_variable_tablet_issue_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_tablet_issue_c a110 
on (a11.request_item_key = a110.row_key) 
union
select 'ldb.d_request_item_variable_cmdb_ci_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_cmdb_ci_c a113 
on (a11.request_item_key = a113.row_key) 
union
select 'ldb.d_request_item_variable_site_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_site_c a117 
on (a11.request_item_key = a117.row_key) 
union
select 'ldb.d_configuration_item_cmdb_ci_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_cmdb_ci_c a113 
on (a11.request_item_key = a113.row_key) 
 join ldb.d_configuration_item_cmdb_ci_c a131 
on (a113.cmdb_ci = a131.row_key) 
union
select 'ldb.d_location_site_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_site_c a117 
on (a11.request_item_key = a117.row_key) 
 join ldb.d_location_site_c a133 
on (a117.site = a133.row_key) 
