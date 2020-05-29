select CAL.year_name YR,
CAL.month_name MN,
--'' as Metrics,
count(F.outage_key) Outages,
SUM(case when wh_lov.dimension_code = 'PLANNED OUTAGE' THEN 1 ELSE 0 END) planned,
SUM(case when wh_lov.dimension_code = 'UNPLANNED OUTAGE' THEN 1 ELSE 0 END) unplanned,
SUM(case when wh_lov.dimension_code = 'DEGRADATION' THEN 1 ELSE 0 END) DEGRADATION
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_key = D.outage_type_src_key
left join #DWH_TABLE_SCHEMA.d_lov_map LOVMAP
on LOV.row_key = LOVMAP.src_key
left JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov 
ON wh_lov.row_key = LOVMAP.wh_key
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month <13
group by YR, MN, cal.month_id
order by YR, cal.month_id