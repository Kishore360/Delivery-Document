SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt from
(select u_category as category_src_id,sourceinstance,SYS_ID   from uclahealth_mdsdb.incident_final) A
JOIN  
  uclahealth_workdb.fs_incident B on sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE  A.category_src_id <> B.category_src_id

)E; 