SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(SELECT A.SYS_ID,B.ROW_ID,A. cause_code A_cause_code,B. cause_code B_cause_code FROM
(SELECT SYS_ID,sourceinstance, u_cause_code AS  cause_code
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  cause_code,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_cause_code <> B_cause_code)e;