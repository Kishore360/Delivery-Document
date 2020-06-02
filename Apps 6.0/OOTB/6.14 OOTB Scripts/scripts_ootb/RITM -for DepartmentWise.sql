select dri.requested_for, dri.requested_for_department ,'' as metric ,  count(frt.row_key) from 
#DWH_TABLE_SCHEMA.f_request_task frt
left join #DWH_TABLE_SCHEMA.d_request_item dri 
on frt.request_item_key = dri.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd 
on dcd.row_key = frt.opened_on_key
where dcd.lagging_count_of_month between 0 and 12 
and dri.soft_deleted_flag = 'N'
group by dri.requested_for, dri.requested_for_department
order by lower(dri.requested_for),lower( dri.requested_for_department)