SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select  count(*) as cnt
from ucsf_mdsdb.incident_final a
inner join ucsf_workdb.dwh_d_incident b on a.sys_id collate utf8_unicode_ci = b.row_id
#and b.row_key <500 
left outer join ucsf_mdsdb.cmn_location_final c on 
 a.u_work_site  = c.sys_id 
 where #c.u_display_name is null and a.u_work_site and
 case when  a.u_work_site is null then 'No Display Name Found' 
 else case when c.u_display_name is null then '-1' else c.u_display_name end end 
 collate utf8_unicode_ci <> b.location_display_name_c
) c;