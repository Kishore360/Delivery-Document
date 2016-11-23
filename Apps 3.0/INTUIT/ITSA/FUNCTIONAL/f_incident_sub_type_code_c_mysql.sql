
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
intuit_mdwdb.f_incident a
INNER JOIN intuit_mdsdb.incident_final b ON a.row_id = b.sys_id
  AND a.source_id=b.sourceinstance
where a.sub_type_code_c <> b.u_sub_type