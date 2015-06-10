SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from rei_workdb.f_incident AA INNER JOIN rei_mdsdb.incident_final BB
ON AA.row_id =BB.sys_id AND AA.source_id=BB.sourceinstance
where category_src_code  <> BB.u_online_store_incident_catego)c