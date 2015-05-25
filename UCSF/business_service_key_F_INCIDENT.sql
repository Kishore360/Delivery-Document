SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from (
select  a.sys_id,
  b.business_service_key_c from ucsf_mdsdb.incident_final a
inner join ucsf_workdb.dwh_f_incident b on a.sys_id collate utf8_general_ci = b.row_id and a.sourceinstance=b.source_id
and b.row_key < 5000 
left outer join ucsf_workdb.dwh_d_configuration_item c on 
 coalesce(a.cmdb_ci collate utf8_general_ci) = c.row_id 
 where 
 case when  a.cmdb_ci is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end = b.business_service_key_c)A
) c;

