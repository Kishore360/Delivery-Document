SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from incomm_mdwdb.f_incident fi JOIN incomm_mdsdb.incident_final  f ON (fi.row_id collate utf8_general_ci=f.sys_id) 
join incomm_mdwdb.d_lov l on l.row_id=COALESCE( CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(f.incident_state )),'UNSPECIFIED')
and fi.state_src_code collate utf8_general_ci <> f.incident_state 
and fi.state_src_key <> l.row_key)c;