select 'ldb.f_request_c   a11' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_c a11 
union
select ' ldb.d_calendar_date a12' as table_name,count(a11.row_key)Row_count
from ldb.f_request_c a11
join ldb.d_calendar_date a12
 on (a11.date_key = a12.row_key)
 union
 select 'ldb.d_calendar_month a13' as table_name,count(a11.row_key)Row_count
 from ldb.f_request_c a11
join ldb.d_calendar_date a12
 on (a11.date_key = a12.row_key)
 join ldb.d_calendar_month a13
 on (a12.month_start_date_key = a13.row_key)
 union
 select 'ldb.d_calendar_quarter a14' as table_name,count(a11.row_key)Row_count
 from ldb.f_request_c a11
 join ldb.d_calendar_date a12
 on (a11.date_key = a12.row_key)
 join ldb.d_calendar_month a13
 on (a12.month_start_date_key = a13.row_key)
 join  ldb.d_calendar_quarter a14      
   on (a13.quarter_start_date_key = a14.row_key)
   union
   select 'ldb.d_request   a15' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join ldb.d_request   a15 on (a11.request_key = a15.row_key)
   union
   select 'ldb.d_internal_contact_assigned_to a16' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join ldb.d_internal_contact_assigned_to a16
   on (a11.assigned_to_key = a16.row_key)
   union
   select 'ldb.d_internal_organization_group   a17' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join ldb.d_internal_organization_group   a17
   on (a11.assignment_group_key = a17.row_key)
   union
   select 'ldb.d_configuration_item    a18' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join ldb.d_configuration_item    a18
   on (a11.configuration_item_key = a18.row_key)
   union
   select 'ldb.d_sc_request_priority    a19' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join ldb.d_sc_request_priority    a19
   on (a11.priority_src_key = a19.row_key)
   union
   select ' ldb.d_calendar_week    a110' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
    join ldb.d_calendar_date a12
 on (a11.date_key = a12.row_key)
 join ldb.d_calendar_week    a110
 on (a12.week_start_date_key = a110.row_key)
 
union
select 'ldb.d_request_location a111' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join   ldb.d_request   a15
    on  (a11.request_key = a15.row_key)
	join ldb.d_request_location a111
	on (a15.location_key = a111.row_key)
	union
	select 'ldb.d_calendar_year      a112' as table_name,count(a11.row_key)Row_count
   from ldb.f_request_c a11
   join        ldb.d_calendar_date      a12
       on   (a11.date_key = a12.row_key)
      join ldb.d_calendar_month a13
        on    (a12.month_start_date_key = a13.row_key)
   join ldb.d_calendar_quarter  a14
  on  (a13.quarter_start_date_key = a14.row_key)
  join        ldb.d_calendar_year      a112
      on   (a14.year_start_date_key = a112.row_key)
	  union
	  select ' ldb.d_sc_request_request_state   a113' as table_name,count(a11.row_key)row_count
	  from ldb.f_request_c a11
	  join ldb.d_sc_request_request_state   a113
	  on  (a11.state_src_key = a113.row_key)