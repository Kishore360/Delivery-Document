select F.outage_key outage_key, 
D.short_description des, 
LOV.dimension_name Outage_Type,
COALESCE(D.message, '') Outage_message, 
to_char(D.start_on, 'fmmm/fmdd/fmyyyy fmHH:MI:SS AM') startdt, 
to_char(D.end_on, 'fmmm/fmdd/fmyyyy fmHH:MI:SS AM') enddt,
--'' as Metrics,
trim(to_char(COALESCE(sum(F.outage_duration::numeric(10,1))/3600, 0),'9999999990D99')) Downtime_in_hrs,
trim(to_char(COALESCE((sum(F.outage_duration::numeric(10,1))/3600)/sum(case when outage_key is not null then 1 else 0 end),0),'9999999990D99')) mean_time_to_rstr,
trim(to_char(sum(F.updates_count),'9999999990D99')) updates_count,
trim(to_char(sum(case when f.outage_key is not null then 1 else 0 end),'9999999990D99')) outages
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.f_incident INC
on INC.incident_key = F.incident_key
left join #DWH_TABLE_SCHEMA.f_change_request REQ
on INC.caused_by_change_key = REQ.change_request_key
left join #DWH_TABLE_SCHEMA.d_incident D_INC
on D_INC.row_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_key = D.outage_type_src_key
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month <13
group by F.outage_key, des, Outage_Type, Outage_message,
startdt, enddt
order by outage_key