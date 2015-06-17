SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from (select a.sys_id,u_srt_held,u_customer_impacting_event,major_incident_flag,
case when u_customer_impacting_event='1' and u_srt_held='1' then 'Y' else 'N' end as Exp_flag
from cardinalhealth_mdsdb.incident_final a inner join cardinalhealth_workdb.dwh_d_incident b 
on a.sys_id collate utf8_unicode_ci= b.row_id)a
where major_incident_flag <> Exp_flag 
) c;