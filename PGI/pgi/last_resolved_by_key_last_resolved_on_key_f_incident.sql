SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from pgi_workdb.dwh_f_incident dfi
join pgi_mdsdb.incident_final incf on dfi.row_id collate utf8_general_ci= incf.sys_id and dfi.source_id= incf.sourceinstance
where
dfi.last_resolved_on_key = COALESCE(DATE_FORMAT(CONVERT_TZ(incf.closed_at,"GMT","America/Los_Angeles"),'%Y%m%d'),'UNSPECIFIED')
or dfi.last_resolved_by_key= case when incf.closed_by is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',incf.closed_by) end)c ;
 