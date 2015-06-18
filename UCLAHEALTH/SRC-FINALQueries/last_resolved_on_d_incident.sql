SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. last_resolved_on A_last_resolved_on,B. last_resolved_on B_last_resolved_on FROM
(SELECT SYS_ID,sourceinstance,
case when u_resolved_date =1 then 'Y' else 'N'end AS last_resolved_on
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT last_resolved_on ,source_id,ROW_ID FROM  uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_last_resolved_on<>B_last_resolved_on)E;