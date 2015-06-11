

select i.row_id,incident_number,CONCAT(d.calendar_date) as opened_date
from f_incident i
join d_calendar_date d
on(i.opened_on_key=d.row_key)
join d_calendar_time t
on(i.opened_time_key=t.row_key)
order by row_id
