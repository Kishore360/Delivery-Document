select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
UNION 
select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
UNION 
select 'ldb.d_calendar_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date a12 ON a11.date_key=a12.row_key
UNION 
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key=a12.row_key
UNION 
select 'ldb.d_configuration_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_configuration_item a12 ON a11.configuration_item_key=a12.row_key
UNION 
select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key=a12.row_key
JOIN ldb.d_calendar_fiscal_period a13 ON a12.period_start_date_key=a13.row_key
UNION
select 'ldb.d_internal_contact_assigned_to a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_internal_contact_assigned_to a12 ON a11.assigned_to_key=a12.row_key 
UNION 
select 'ldb.d_internal_organization_group a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_internal_organization_group a12 ON a11.assignment_group_key=a12.row_key   
UNION 
select 'ldb.d_business_service a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_business_service a12 ON a11.business_service_key=a12.row_key 
UNION 
select 'ldb.d_calendar_month a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date a12 ON a11.date_key=a12.row_key
JOIN ldb.d_calendar_month a13 ON a12.month_start_date_key=a13.row_key 
UNION 
select 'ldb.d_incident_contacttype a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident_contacttype a12 ON a11.reported_type_src_key=a12.row_key
UNION 
select 'ldb.d_configuration_item_incident_service_offering_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_configuration_item_incident_service_offering_c a12 ON a11.service_offering_c_key=a12.row_key
UNION 

select 'ldb.d_calendar_date_fiscal a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key=a12.row_key
JOIN ldb.d_calendar_fiscal_week a13 ON a12.week_start_date_key=a13.row_key
UNION 
select 'ldb.d_lov_incident_service_type_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
JOIN ldb.d_lov_incident_service_type_c a13 ON a12.service_type_src_c_key=a13.row_key
UNION 
select 'ldb.d_incident_category a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
JOIN ldb.d_incident_category a13 ON a12.category_src_key=a13.row_key
UNION 
select 'ldb.d_incident_close_code a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
JOIN ldb.d_incident_close_code a13 ON a12.close_code_src_key=a13.row_key
UNION 
select 'ldb.d_incident_severity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
JOIN ldb.d_incident_severity a13 ON a12.severity_src_key=a13.row_key
UNION 
select 'ldb.d_incident_state a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
JOIN ldb.d_incident_state a13 ON a12.state_src_key=a13.row_key
UNION 
select 'ldb.d_parent_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_incident a12 ON a11.incident_key=a12.row_key  
JOIN ldb.d_parent_incident a13 ON a12.parent_incident_key=a13.row_key
UNION 
select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key=a12.row_key
JOIN ldb.d_calendar_fiscal_quarter a13 ON a12.quarter_start_date_key=a13.row_key 
UNION 
select 'ldb.d_calendar_fiscal_quarter a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
JOIN ldb.d_calendar_date_fiscal a12 ON a11.fiscal_date_key=a12.row_key
JOIN ldb.d_calendar_fiscal_quarter a13 ON a12.quarter_start_date_key=a13.row_key 
JOIN ldb.d_calendar_fiscal_year a14 ON a13.year_start_date_key=a14.row_key




