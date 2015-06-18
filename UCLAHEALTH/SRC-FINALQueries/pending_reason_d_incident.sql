SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.pending_reason A_pending_reason ,B.pending_reason B_pending_reason FROM
(SELECT SYS_ID,sourceinstance, u_pending_code AS pending_reason
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT pending_reason,source_id,ROW_ID FROM  uclahealth_mdwdb.d_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_pending_reason<>B_pending_reason)E;