SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.f_facility_request  f JOIN (SELECT id, TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',mi.duration) as duration FROM netflix_mdsdb.metric_instance_final mi JOIN netflix_mdsdb.metric_definition_final mf ON mi.definition = mf.sys_id WHERE mf.table = 'facilities' AND NAME = 'FAC - Create to Resolve Duration') mi on f.row_id = mi.id and f.open_to_close_duration <> mi.duration) c

