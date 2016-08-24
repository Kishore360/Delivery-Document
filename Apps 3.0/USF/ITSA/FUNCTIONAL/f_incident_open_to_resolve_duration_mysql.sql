  SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from usf_mdwdb.f_incident a
join  usf_mdwdb.d_incident b on  a.source_id = b.source_id and a.row_id = b.row_id
where open_to_resolve_duration <> open_to_close_duration or
resolve_to_close_duration <> TIMESTAMPDIFF(SECOND,last_resolved_on,closed_on)) c
 