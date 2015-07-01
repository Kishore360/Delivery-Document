
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  outage_flag_c A_outage_flag_c ,B.  outage_flag_c B_outage_flag_c FROM
(SELECT SYS_ID,sourceinstance, 
case when u_outage =1 then 'Y' else 'N'end AS   outage_flag_c
FROM uclahealth_mdsdb.incident_final )A
 JOIN  
(SELECT  outage_flag_c ,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_outage_flag_c<> B_outage_flag_c)E;