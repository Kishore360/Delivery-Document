
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. pending_change_c A_pending_change_c,B. pending_change_c B_pending_change_c FROM
(SELECT SYS_ID,sourceinstance, u_pending_change AS  pending_change_c
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  pending_change_c ,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_pending_change_c<> B_pending_change_c)E;