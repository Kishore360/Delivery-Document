SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. reopened_flag A_reopened_flag ,B. reopened_flag B_reopened_flag FROM
(SELECT SYS_ID,sourceinstance,CASE when u_ticket_reopened =1 THEN 'Y' else 'N'END AS reopened_flag 
FROM uclahealth_mdsdb.incident_final )A
 JOIN  
(SELECT reopened_flag ,source_id,ROW_ID FROM  uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_reopened_flag<>B_reopened_flag)E;