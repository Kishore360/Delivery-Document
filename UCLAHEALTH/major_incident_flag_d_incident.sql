SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.MAJOR_INCIDENT_FLAG_SRC A_MAJOR_INCIDENT_FLAG_SRC,
B.MAJOR_INCIDENT_FLAG B_MAJOR_INCIDENT_FLAG_SRC FROM
(SELECT SYS_ID,sourceinstance,CASE WHEN PRIORITY IN (1,0) THEN 'Y' else 'N'END AS MAJOR_INCIDENT_FLAG_SRC 
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT MAJOR_INCIDENT_FLAG,source_id,ROW_ID FROM  uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_MAJOR_INCIDENT_FLAG_SRC<>B_MAJOR_INCIDENT_FLAG_SRC)E;