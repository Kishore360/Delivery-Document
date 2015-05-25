SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt 
from aaa_mdsdb.incident_final a 
inner  join aaa_workdb.dwh_f_incident b on a.sys_id collate utf8_unicode_ci=b.row_id 
and a.sourceinstance=b.source_id
left outer join aaa_workdb.dwh_d_internal_organization c on a.vendor collate utf8_unicode_ci=c.row_id
where case when  a.vendor is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end<>b.vendor_key_c

) c;