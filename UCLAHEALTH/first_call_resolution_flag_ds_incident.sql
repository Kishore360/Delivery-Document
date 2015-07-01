SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
 SELECT A.SYS_ID,B.ROW_ID,A. first_call_resolution_flag A_first_call_resolution_flag ,B. first_call_resolution_flag B_first_call_resolution_flag FROM
(SELECT SYS_ID,sourceinstance, 
case when u_first_call_resolved=1 then 'Y' else 'N'end  AS  first_call_resolution_flag
FROM uclahealth_mdsdb.incident_final )A
JOIN  
(SELECT  first_call_resolution_flag,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_first_call_resolution_flag <> 
B_first_call_resolution_flag)e;