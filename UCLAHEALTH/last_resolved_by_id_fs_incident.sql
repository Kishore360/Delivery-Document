SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  last_resolved_by_id A_last_resolved_by_id,B.  last_resolved_by_id B_last_resolved_by_id FROM
(SELECT SYS_ID,sourceinstance, u_resolved_by  AS   last_resolved_by_id
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT REPLACE(last_resolved_by_id,'INTERNAL_CONTACT~','') AS last_resolved_by_id
,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_I0ED)H
WHERE A_last_resolved_by_id<>  B_last_resolved_by_id; 