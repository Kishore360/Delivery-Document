SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. reprioritization_count_c A_reprioritization_count_c ,B. reprioritization_count_c B_reprioritization_count_c FROM
(SELECT SYS_ID,sourceinstance,u_reprioritization_count AS reprioritization_count_c
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT reprioritization_count_c ,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_reprioritization_count_c<>B_reprioritization_count_c)E;