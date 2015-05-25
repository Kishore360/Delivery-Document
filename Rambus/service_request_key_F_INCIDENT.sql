SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt
from (
select  a.sys_id,a.u_service_request ,c.row_id,c.row_key,b.service_request_key_c ,
case when  a.u_service_request  is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end as service
from rambus_mdsdb.incident_final  a
inner join rambus_workdb.dwh_f_incident 	 b on a.sys_id collate utf8_unicode_ci = b.row_id 
and a.sourceinstance=b.source_id and  incident_class_c='INCIDENT'
left outer join rambus_workdb.dwh_d_incident c on 
 a.u_service_request  collate utf8_unicode_ci = c.row_id and c.incident_class_c='ADHOC_REQ'
 where case when  a.u_service_request  is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <> b.service_request_key_c)A

) c;