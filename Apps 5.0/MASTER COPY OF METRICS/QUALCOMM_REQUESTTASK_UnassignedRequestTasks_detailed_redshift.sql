select  'Unassigned Request Tasks'as Metric_Name,count(a.row_key) 
from ldb.f_request_task a
                join        ldb.d_request_task         a17
                  on         (a.request_task_key = a17.row_key)

                join        ldb.d_internal_contact_assigned_to       a15
                  on         (a.assigned_to_key = a15.row_key)
join   ldb.d_calendar_date  A14
         on   (a. opened_on_key = a14.row_key)
         join ldb.d_calendar_month a16
         on   (a14.month_start_date_key = a16.row_key)
where ((a.assigned_to_key in (0, -1)
or a15.full_name is null)
and (a16.lagging_count_of_month between 0 and 12
or a17.backlog_flag = 'Y'))
