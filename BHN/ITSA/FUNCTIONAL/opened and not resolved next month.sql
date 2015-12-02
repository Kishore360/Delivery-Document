SELECT 
(case when opened_on.calendar_date>  opened_on.month_start_date
       and (opened_on.calendar_date<opened_on.month_end_date+1
               and resolved_on.calendar_date> opened_on.month_end_date+1
               or  dlm.dimension_wh_code='OPEN') then 1 else 0 end ) as carried_over_count_c,
a.*
FROM bhn_mdwdb.f_incident a
left join bhn_mdwdb.d_calendar_date opened_on
on a.opened_on_key=opened_on.row_key 
left join bhn_mdwdb.d_calendar_date resolved_on
on a.last_resolved_on_key=resolved_on.row_key
left join bhn_mdwdb.d_lov_map dlm
on a.state_src_key=dlm.src_key
WHERE a.soft_deleted_flag = 'N';  



 select max(opened_on_key),max(last_resolved_on_key),incident_number  from bhn_mdwdb.f_incident f
join bhn_mdwdb.d_lov_map map on f.state_src_key = map.src_key where map.dimension_wh_code ='open'
group by incident_number having max(opened_on_key)< 20151101 ;
