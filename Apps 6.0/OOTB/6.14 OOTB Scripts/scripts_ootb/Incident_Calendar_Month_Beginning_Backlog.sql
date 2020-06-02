select d.incident_number as incident,
dcd.month_name_abbreviated||' '||dcd.year_id as Calendar_Month,
d.short_description as Incident_short_Description,
sum(ai.open_bal_opened)-sum(ai.open_bal_resolved)as age
from #DWH_TABLE_SCHEMA.f_incident f
 join #DWH_TABLE_SCHEMA.d_incident d
on f.incident_key=d.row_key
and f.soft_deleted_flag<>'Y'
and d.soft_deleted_flag<>'Y'
and d.backlog_flag='Y'
--join #DWH_TABLE_SCHEMA.d_internal_contact dr_a
--on f.assigned_to_key=dr_a.row_key
--join 
--(select d2.* from
--#DWH_TABLE_SCHEMA.d_lov d2
----where dimension_class='PRIORITY~INCIDENT'
--union
--select d2.* from
--#DWH_TABLE_SCHEMA.d_lov d2
--where row_key in (0,-1)
--) lov_priority
--on f.priority_src_key=lov_priority.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on f.opened_on_key=dcd.row_key
--and dcd.lagging_count_of_month between 0 and 12
full join ldb.a_incident_monthly ai
on ai.row_key=dcd.month_start_date_key
group by d.incident_number,dcd.month_name_abbreviated||' '||dcd.year_id,d.short_description
order by d.incident_number,dcd.month_name_abbreviated||' '||dcd.year_id,d.short_description 