SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
FROM uclahealth_mdsdb.incident_final A
 JOIN  
uclahealth_mdwdb.d_incident B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE CASE WHEN PRIORITY IN (1,0) THEN 'Y' else 'N'END<>B.MAJOR_INCIDENT_FLAG)E;