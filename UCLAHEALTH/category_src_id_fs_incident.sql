SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  category_src_id A_category_src_id ,B.  category_src_id B_category_src_id  FROM
(SELECT SYS_ID,sourceinstance, u_category AS   category_src_id 
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT  REPLACE(category_src_id,'CATEGORY~INCIDENT~~~','') as category_src_id
 ,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_category_src_id <> B_category_src_id)E; 