SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from rei_workdb.f_incident a
inner join rei_workdb.d_incident b on a.row_id = b.row_id and a.source_id = b.source_id
where
resolve_to_close_duration <> TIMESTAMPDIFF(SECOND,last_resolved_on,closed_on) or
open_to_resolve_duration <> TIMESTAMPDIFF(SECOND,opened_on,last_resolved_on))c