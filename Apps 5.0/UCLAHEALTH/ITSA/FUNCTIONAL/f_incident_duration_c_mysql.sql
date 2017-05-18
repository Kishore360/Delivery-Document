SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  duration_c A_duration_c,B.  duration_c B_duration_c FROM
(SELECT SYS_ID,sourceinstance, TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',calendar_duration) AS   duration_c
FROM uclahealth_mdsdb.incident_final )A
  JOIN  
(SELECT  duration_c,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_duration_c<> B_duration_c)E;