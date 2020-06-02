select frt.row_key ,dr.row_key ,dri.row_key , '' as metric , count(frt.row_key) from #DWH_TABLE_SCHEMA.f_request_task frt 
 join #DWH_TABLE_SCHEMA.d_request_task drt 
on frt.request_task_key = drt.row_key
 join #DWH_TABLE_SCHEMA.d_calendar_date dcd 
on dcd.row_key = frt.opened_on_key 
 join #DWH_TABLE_SCHEMA.d_request dr
on dr.row_key = frt.request_key 
join #DWH_TABLE_SCHEMA.d_request_item dri
on dri.row_key = frt.request_item_key
where dcd.lagging_count_of_month between 0 and 12
and frt.soft_deleted_flag = 'N'
group by frt.row_key ,dr.row_key ,dri.row_key
order by frt.row_key asc