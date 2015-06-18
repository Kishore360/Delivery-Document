SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  outage_type_src_code_c A_outage_type_src_code_c,B.  outage_type_src_code_c B_outage_type_src_code_c FROM
(SELECT SYS_ID,sourceinstance, u_outage_type AS   outage_type_src_code_c 
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  outage_type_src_code_c ,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_outage_type_src_code_c <> B_outage_type_src_code_c)E;