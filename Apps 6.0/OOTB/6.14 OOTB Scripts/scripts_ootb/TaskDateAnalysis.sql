select  
 frt.row_key ,dic.full_name ,
to_char(drt.work_start_on ,'fmmm/fmdd/yyyy fmHH:MI:SS AM')actual_start_date , to_char(drt.work_end_on,'fmmm/fmdd/yyyy fmHH:MI:SS AM')actual_end_date ,to_char(drt.created_on ,'fmmm/fmdd/yyyy fmHH:MI:SS AM')createdon, to_char(drt.closed_on,'fmmm/fmdd/yyyy fmHH:MI:SS AM')closed_on ,  to_char(drt.due_on,'fmmm/fmdd/yyyy fmHH:MI:SS AM' )due_on, to_char(drt.expected_start_on,'fmmm/fmdd/yyyy fmHH:MI:SS AM')expected_start_on , to_char(drt.opened_on,'fmmm/fmdd/yyyy fmHH:MI:SS AM')opened_on ,'' as metric ,  count(frt.row_key )
from #DWH_TABLE_SCHEMA.f_request_task frt 
 join #DWH_TABLE_SCHEMA.d_request_task drt 
on frt.request_task_key = drt.row_key
join #DWH_TABLE_SCHEMA.d_internal_contact dic 
on dic.row_key = frt.opened_by_key

join #DWH_TABLE_SCHEMA.d_calendar_date dcd 
on frt.opened_on_key = dcd.row_key

where dcd.lagging_count_of_month between 0 and 12
and frt.soft_deleted_flag = 'N'
and drt.over_due_flag = 'Y'
group by   frt.row_key ,dic.full_name,actual_start_date ,actual_end_date , createdon , closed_on, due_on , expected_start_on , opened_on
order by frt.row_key, lower(dic.full_name)

