SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt,cause_code from uclahealth_mdsdb.incident_final 
 JOIN  
  uclahealth_mdwdb.d_incident B on A.sourceinstance=B.source_id AND B.ROW_ID=A.SYS_ID
WHERE  cause_code<> B.cause_code)E;