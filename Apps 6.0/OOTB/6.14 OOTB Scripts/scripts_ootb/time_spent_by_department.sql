/* Timespent on calls made by each department*/
select
dintorg.organization_name as department
,count(1) as no_calls
,to_char(sum(time_spent/86400.00),'FM9,999,990.0') time_spent

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'
join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11
join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
on dintorg.row_key=f.department_key
group by dintorg.organization_name
order by dintorg.organization_name;
