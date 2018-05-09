SELECT count(distinct a.row_key) as All_Task_Keyword_Count
FROM ldb.f_task_fss_c_keyword a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key 
where b.lagging_count_of_month between 0 and 24 

