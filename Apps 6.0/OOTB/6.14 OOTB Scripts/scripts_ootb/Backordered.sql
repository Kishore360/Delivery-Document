select dio.organization_name as "department", dri.backordered_flag as "Back Ordered" ,''as metric , count(case when dri.backlog_flag = 'Y'then 1 end) as " Backlog" from #DWH_TABLE_SCHEMA.f_request_item fri 
left join #DWH_TABLE_SCHEMA.d_request_item dri 
on fri.request_item_key = dri.row_key
left join #DWH_TABLE_SCHEMA.d_internal_organization dio
on fri.opened_by_department_key = dio.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on dcd.row_key = fri.opened_on_key
--left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
--on dcd1.row_key = fri.closed_on_key
where dcd.lagging_count_of_month between 0 and 12
--or dcd1.lagging_count_of_month between 0 and 12
and fri.soft_deleted_flag = 'N'
group by dio.organization_name , dri.backordered_flag
order by lower(dio.organization_name), lower(dri.backordered_flag)asc