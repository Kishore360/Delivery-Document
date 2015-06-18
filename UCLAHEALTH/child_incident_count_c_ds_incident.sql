SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. child_incident_count_c A_child_incident_count_c  ,B. child_incident_count_c B_child_incident_count_c  FROM
(SELECT SYS_ID,sourceinstance,u_child_incident_count AS child_incident_count_c
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT child_incident_count_c ,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_child_incident_count_c <> B_child_incident_count_c)E;