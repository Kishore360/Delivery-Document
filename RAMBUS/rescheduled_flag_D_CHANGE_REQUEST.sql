SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from (
select s.sys_id, s.u_rescheduled_change,i.row_id, i.rescheduled_flag,
case when s.u_rescheduled_change = '1' then 'Y' when s.u_rescheduled_change ='0' then 'N' else null end as rescheduledflag 
from rambus_mdsdb.change_request_final s
inner join rambus_workdb.dwh_d_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id and 
s.sourceinstance = i.source_id 
)A where  coalesce(rescheduledflag,' ')<>coalesce(rescheduled_flag,' ')

) c;