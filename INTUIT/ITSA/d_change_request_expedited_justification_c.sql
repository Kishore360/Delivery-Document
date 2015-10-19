
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN cnt > 0 
THEN 'Data did not Match.' else 'MATCHED'end as result from
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.expedited_justification_c <> SOURC.u_expedited_justification)temp;

 