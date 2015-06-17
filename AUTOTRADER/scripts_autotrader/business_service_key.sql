SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from autotrader_workdb.dwh_f_incident a
left outer join autotrader_mdsdb.incident_final b on a.row_id collate utf8_general_ci=b.sys_id and
a.source_id=b.sourceinstance
where a.business_service_key_c = coalesce(b.cmdb_ci,'UNSPECIFIED')) a