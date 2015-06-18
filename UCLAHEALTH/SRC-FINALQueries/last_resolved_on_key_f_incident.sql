
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  last_resolved_on_key A_last_resolved_on_key,B.  last_resolved_on_key B_last_resolved_on_key FROM
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d')  AS   last_resolved_on_key
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  last_resolved_on_key,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_last_resolved_on_key<> B_last_resolved_on_key)E;
