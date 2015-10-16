SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final s
 left  JOIN  intuit_mdwdb.d_outage_c t
on  s.SYS_ID= t.ROW_ID and s.sourceinstance=t.source_id
where s.TYPE<>t.outage_type )b
