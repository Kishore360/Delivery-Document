SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM( select  
  count(*) as cnt from ucsf_mdsdb.incident_final a
inner join ucsf_workdb.dwh_f_incident b on a.sys_id collate utf8_general_ci = b.row_id
and b.row_key < 5000
left outer join ucsf_workdb.dwh_d_configuration_item c on 
 coalesce(a.u_configuration_item collate utf8_general_ci) = c.row_id 
 where case when  a.u_configuration_item is null then '0' 
 when c.row_key is null then '-1' else c.row_key end  <> b.configuration_item_key

) c;