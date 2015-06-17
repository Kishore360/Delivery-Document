SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select  count(*) as cnt
from ucsf_mdsdb.incident_final a
inner join ucsf_workdb.dwh_f_incident b on a.sys_id collate utf8_general_ci = b.row_id
and b.row_key <500 
left outer join ucsf_workdb.dwh_d_location c on 
 coalesce(a.u_parent_work_site collate utf8_general_ci) = c.row_id 
 where #c.row_key is null and a.u_parent_work_site and
 case when  a.u_parent_work_site is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end  <> b.location_key
) c;