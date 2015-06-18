SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. incident_type A_incident_type ,B. incident_type B_incident_type FROM
(SELECT SYS_ID,sourceinstance, u_incident_type AS  incident_type
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  incident_type,source_id,ROW_ID FROM  uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_incident_type<>B_incident_type)E;