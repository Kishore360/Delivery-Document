SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from incomm_mdwdb.f_incident fs join incomm_mdwdb.d_incident f  on fs.row_id collate utf8_general_ci=f.row_id and fs.source_id=f.source_id and f.row_key<200 and fs.resolve_to_close_duration <> TIMESTAMPDIFF(SECOND,f.last_resolved_on,f.closed_on) and fs.open_to_resolve_duration <> TIMESTAMPDIFF(SECOND,f.opened_on,f.last_resolved_on)) c;


