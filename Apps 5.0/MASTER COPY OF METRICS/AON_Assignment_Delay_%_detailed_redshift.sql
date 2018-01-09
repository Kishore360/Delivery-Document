select  
(a.x/b.y)*100  from
(

select count(a11.incident_key)*1.0 as x
from ldb.f_incident_activity a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a110 
on (a12.state_src_key = a110.row_key) 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 and a110.wh_dimension_code in ('RESOLVED','CLOSED')
and a11.reassignment_count>=1) a
cross join (
select count(a11.incident_key)*1.0 as y
from ldb.f_incident_activity a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a110 
on (a12.state_src_key = a110.row_key) 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
WHERE a13.lagging_count_of_month between 0 and 12 and a110.wh_dimension_code in ('RESOLVED','CLOSED')) b 

