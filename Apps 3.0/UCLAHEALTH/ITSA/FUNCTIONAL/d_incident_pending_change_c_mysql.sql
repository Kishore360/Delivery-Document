SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdsdb.incident_final 
 JOIN  
 uclahealth_mdwdb.d_incident B on sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE u_pending_change<> B.pending_change_c)E;