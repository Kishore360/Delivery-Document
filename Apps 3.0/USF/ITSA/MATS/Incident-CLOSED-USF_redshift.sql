SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'f_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)

union

select  'd_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_internal_organization_legalentity	a12
   on         (a11.company_key = a12.row_key)

union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_internal_contact	a13
   on         (a11.closed_by_key = a13.row_key)

union

select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_calendar_time	a14
   on         (a11.opened_time_key = a14.row_key)

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_calendar_date	a15
   on         (a11.closed_on_key = a15.row_key)


union

select  'd_calendar_Year' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_calendar_date	a16
   on         (a11.closed_on_key = a16.row_key)
  join        ldb.d_calendar_year	a15
   on         (a16.year_start_date_key = a15.row_key)



union

select  'd_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_incident	a17
   on         (a11.incident_key = a17.row_key)


union

select  'd_incident_subcategory' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_incident_subcategory	a18
   on         (a11.sub_category_src_key = a18.row_key)

union

select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_internal_organization_department	a19
   on         (a11.opened_by_department_key = a19.row_key)


union

select  'd_customer' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident_closed    a11
join asu_mdwdb.d_lov_map map on a11.state_src_key=map.src_key
and map.dimension_class not IN ('STATE~GEO','CITY~GEO', 'COUNTRY~GEO','CURRENCY')
and map.src_key not in(-1)
   join        ldb.d_customer	a19
   on         (a11.customer_key = a19.row_key)

)a
)b