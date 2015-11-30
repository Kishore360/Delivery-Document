
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from asu_mdsdb.incident_final a
left join asu_mdwdb.d_incident b on a.sourceinstance=b.source_id and a.sys_id=b.row_id
where case when a.u_reopen_flag = 1 then 'Y' else 'N' end <>b.reopen_c_flag

)i; 
