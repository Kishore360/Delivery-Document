SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN cnt > 0 THEN 'Data did not Match.'
(SELECT COUNT(*) as cnt 
FROM intuit_mdsdb.change_request_final SOURC
LEFT JOIN intuit_mdwdb.d_change_request TRGT ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 
WHERE TRGT.traffic_move_recommended_c_flag <> CASE WHEN SOURC.u_traffic_move_recommended = 1 THEN 'Y' ELSE 'N' END)temp;


