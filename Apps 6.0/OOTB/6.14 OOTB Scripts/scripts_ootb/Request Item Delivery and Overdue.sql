select  dr.row_key ,to_char(dri.estimated_delivery  ,'fmMM/fmDD/YYYY fmHH12:fmMM:fmSS AM')as "estimated delivery" ,
 to_char(cast(dri.due_on as date),'fmMM/fmDD/YYYY') as "Due on Date", '' as Metrics , sum(case when dri.over_due_flag = 'Y'Then 1 else 0 end ) as Over_due 
from #DWH_TABLE_SCHEMA.f_request_item fri 
join #DWH_TABLE_SCHEMA.d_request_item dri 
on fri.request_item_key = dri.row_key
join #DWH_TABLE_SCHEMA.d_request dr
on fri.request_key = dr.row_key
 join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on dcd.row_key = fri.opened_on_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on dcd1.row_key = fri.closed_on_key
where dcd.lagging_count_of_month between 0 and 12
or dcd1.lagging_count_of_month between 0 and 12
and dr.soft_deleted_flag = 'N'
group by dr.row_key, dri.estimated_delivery , dri.due_on 
order by dr.row_key ,dri.estimated_delivery, dri.due_on  asc 

