select 'ldb.f_m2m_incidents_change_requests_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_m2m_incidents_change_requests_c a11 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_m2m_incidents_change_requests_c a11 
 join ldb.d_incident a12 
	on (a11.incident_key = a12.row_key)  
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_m2m_incidents_change_requests_c a11 
 join ldb.d_change_request a13 
	on (a11.change_request_key = a13.row_key)  
union
select 'ldb.d_incident_severity a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_m2m_incidents_change_requests_c a11 
 join ldb.d_incident a12 
 on (a11.incident_key = a12.row_key) 
	join ldb.d_incident_severity a14 
	on (a12.severity_src_key = a14.row_key) 

