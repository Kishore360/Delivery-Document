SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,CONCAT('OUTAGE_TYPE_C~INCIDENT~~~',A.  outage_type_src_c_id)  A_outage_type_src_c_id,B.  outage_type_src_c_id B_outage_type_src_c_id FROM
(SELECT SYS_ID,sourceinstance, u_outage_type AS   outage_type_src_c_id
FROM uclahealth_mdsdb.incident_final )A
 JOIN  
(SELECT   outage_type_src_c_id AS outage_type_src_c_id
 ,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_outage_type_src_c_id<> B_outage_type_src_c_id)E;
