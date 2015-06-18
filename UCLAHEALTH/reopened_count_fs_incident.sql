SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  reopened_count A_reopened_count,B.  reopened_count B_reopened_count FROM
(SELECT SYS_ID,sourceinstance, u_reopen_count AS   reopened_count
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  reopened_count,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_reopened_count<> B_reopened_count)E;