select  dmi.item_category ,dmi.item_type_code , '' as metrics , round(count(case when dri.backlog_flag = 'Y' then dri.backlog_flag end),0)  from 
#DWH_TABLE_SCHEMA.d_master_item dmi 
left join #DWH_TABLE_SCHEMA.f_request_item fri
on fri.catalog_item_key = dmi.row_key
left join #DWH_TABLE_SCHEMA.d_request_item dri 
on fri.request_item_key = dri.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd 
on dcd.row_key = fri.opened_on_key
--left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
--on dcd1.row_key = fri.closed_on_key
where dcd.lagging_count_of_month between 0 and 12
--or dcd1.lagging_count_of_month between 0 and 12
and fri.soft_deleted_flag ='N'
group by  dmi.item_category ,dmi.item_type_code
order by lower(dmi.item_category) , lower(dmi.item_type_code) asc