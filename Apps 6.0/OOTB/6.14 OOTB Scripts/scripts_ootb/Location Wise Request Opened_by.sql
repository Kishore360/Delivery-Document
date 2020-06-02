select dr.opened_by_location, dr.opened_by ,'' as metric ,  count(frt.row_key) from 
#DWH_TABLE_SCHEMA.f_request_task frt
left join #DWH_TABLE_SCHEMA.d_request dr 
on frt.request_key = dr.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd 
on dcd.row_key = frt.opened_on_key
where dcd.lagging_count_of_month between 0 and 12 
and dr.soft_deleted_flag = 'N'
group by dr.opened_by_location, dr.opened_by
order by lower(dr.opened_by_location),lower( dr.opened_by)