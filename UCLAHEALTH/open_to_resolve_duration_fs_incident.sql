SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  open_to_resolve_duration A_open_to_resolve_duration,B.  open_to_resolve_duration B_open_to_resolve_duration FROM
(SELECT SYS_ID,sourceinstance, TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',business_duration )  AS   open_to_resolve_duration
FROM uclahealth_mdsdb.incident_final p )A
LEFT OUTER JOIN  
(SELECT  open_to_resolve_duration,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_open_to_resolve_duration<> B_open_to_resolve_duration)E;