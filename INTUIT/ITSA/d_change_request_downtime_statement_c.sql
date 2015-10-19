SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN cnt > 0 THEN 'Data did not Match.'
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.downtime_statement_c <> CASE WHEN SOURC.u_downtime_statement = 1 THEN 'Y' ELSE 'N' END)temp;


