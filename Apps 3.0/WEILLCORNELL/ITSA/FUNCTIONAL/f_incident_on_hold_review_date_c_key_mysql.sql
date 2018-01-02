SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from  weillcornell_mdsdb.incident_final s
inner join weillcornell_mdwdb.f_incident i on s.sys_id=i.row_id and s.sourceinstance = i.source_id 
where CONVERT_TZ(coalesce(u_on_hold_review_date,' '),'GMT','America/New_York') <>(i.on_hold_review_date_c_key)
) c;

