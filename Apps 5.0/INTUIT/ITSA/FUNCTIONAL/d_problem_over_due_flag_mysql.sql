



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt from intuit_mdwdb.d_problem dp 
JOIN intuit_mdwdb.f_problem fp 
 ON dp.row_id = fp.row_id 
 AND dp.source_id = fp.source_id 

WHERE over_due_flag <> CASE WHEN fp.state_src_code NOT IN ( 13, 4 )AND 
TIMESTAMPDIFF(DAY,( SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' ),dp.opened_on) > 5 THEN 'Y' ELSE 'N' END)a;