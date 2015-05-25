SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from pgi_workdb.dwh_f_incident a
inner join pgi_workdb.dwh_d_incident b on a.row_id = b.row_id
where 
 open_to_resolve_duration = TIMESTAMPDIFF(SECOND,opened_on,last_resolved_on))c;