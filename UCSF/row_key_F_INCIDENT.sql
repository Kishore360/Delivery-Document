SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM( select count(*) as cnt from ucsf_workdb.dwh_d_configuration_item c inner join ucsf_mdsdb.incident_final s 
on convert(s.u_configuration_item using utf8) = convert(c.row_id using utf8) 
inner join ucsf_workdb.dwh_f_incident  i on convert(s.sys_id using utf8)=convert(i.row_id using utf8)
where i.configuration_item_key <> c.row_key
 ) c;