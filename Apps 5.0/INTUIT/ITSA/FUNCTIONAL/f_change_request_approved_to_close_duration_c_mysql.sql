SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt from 
intuit_mdwdb.f_change_request a
INNER JOIN intuit_mdsdb.change_request_final b ON a.row_id = b.sys_id
  AND a.source_id=b.sourceinstance
where a.approved_to_close_duration_c <> TIMESTAMPDIFF(SECOND,approval_set,closed_at))a;