
select
hr_change_number
, created_on
,location_name
from 
(select
f_hr.hr_change_number
,f_hr.row_id
,TO_CHAR(D.calendar_date,'MM/DD')  as created_on
,loc.location_name
FROM 
 #DWH_TABLE_SCHEMA.f_hr_change f_hr

inner JOIN #DWH_TABLE_SCHEMA.d_calendar_date D
ON f_hr.opened_on_key=D.row_key

inner JOIN #DWH_TABLE_SCHEMA.d_location loc
ON f_hr.location_key=loc.row_key
and   f_hr.soft_deleted_flag<>'Y'
order by 
f_hr.row_id
,D.row_id,loc.location_name desc
)A