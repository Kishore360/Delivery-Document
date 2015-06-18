
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A. patient_safety_c A_patient_safety_c,B. patient_safety_c B_patient_safety_c FROM
(SELECT SYS_ID,sourceinstance, u_patient_safety AS  patient_safety_c
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  patient_safety_c ,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_patient_safety_c<> B_patient_safety_c)E;