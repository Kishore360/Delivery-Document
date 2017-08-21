select 'ldb.f_incident_outage_multiple_analysis_c a11 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
union
select 'ldb.d_channels_c a12 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_channels_c a12 
on (a11.channels_c_key = a12.row_key) 
union
select 'ldb.d_node_c a13 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_node_c a13 
on (a11.node_c_key = a13.row_key) 
union
select 'ldb.d_legs_c a14 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_legs_c a14 
on (a11.legs_c_key = a14.row_key) 
union
select 'ldb.d_location_incident_outage_c a15 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_location_incident_outage_c a15 
on (a11.location_key = a15.row_key) 
union
select 'ldb.d_channel_regions_c a16 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_channel_regions_c a16 
on (a11.channel_regions_c_key = a16.row_key) 
union
select 'ldb.d_cmdb_ci_service_c a17 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_cmdb_ci_service_c a17 
on (a11.outage_service_c_incident_key = a17.row_key) 
union
select 'ldb.d_alarm_c a18 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_alarm_c a18 
on (a11.alarm_c_key = a18.row_key) 
union
select 'ldb.d_cmts_c a19 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_cmts_c a19 
on (a11.cmts_c_key = a19.row_key) 
union
select 'ldb.d_headend_c a110 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_headend_c a110 
on (a11.headend_c_key = a110.row_key) 
union
select 'ldb.d_hub_c a111 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_hub_c a111 
on (a11.hub_c_key = a111.row_key) 
union
select 'ldb.d_incident_outage_multiple_c a112 ' as Table_name, count(a11.incident_key) Row_Count
from ldb.f_incident_outage_multiple_analysis_c a11 
left outer join ldb.d_incident_outage_multiple_c a112 
on (a11.incident_key = a112.row_key) 
