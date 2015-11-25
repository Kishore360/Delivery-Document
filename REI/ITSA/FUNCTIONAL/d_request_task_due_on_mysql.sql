SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt

FROM rei_mdsdb.sc_request_final a 
 LEFT JOIN rei_mdwdb.d_request_task b  
ON 
a.sys_id =b.row_id
 AND a.sourceinstance = b.source_id
 
WHERE convert_tz(a.due_date,'GMT','America/Los_Angeles')<>b.due_on) c;