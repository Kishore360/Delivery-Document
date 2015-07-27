 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdsdb.incident_final x 
LEFT join uclahealth_mdwdb.d_incident y on x.u_category=y.row_id 
  left JOIN  
uclahealth_mdwdb.f_incident B on y.source_id=B.source_id AND B.ROW_ID=y.row_ID
WHERE  y.row_key <> B.category_src_key)E; 