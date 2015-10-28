SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 

ELSE 'Data Matched' END AS Message 

FROM (

SELECT COUNT(*) as cnt 

FROM intuit_mdsdb.change_request_final SOURC

LEFT JOIN intuit_mdsdb.cmdb_ci_environment_final LKP 

ON LKP.sys_id=SOURC.u_environment 

LEFT JOIN intuit_mdwdb.d_change_request TRGT 

ON TRGT.row_id =SOURC.sys_id AND TRGT.source_id=SOURC.sourceinstance 

WHERE TRGT.environment_c <> LKP.name)temp