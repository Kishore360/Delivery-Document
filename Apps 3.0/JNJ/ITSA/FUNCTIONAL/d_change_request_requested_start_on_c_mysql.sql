
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.d_change_request a11
join jnj_mdsdb.change_request_final a12 on a11.row_id = a12.sys_id and a11.source_id= a12.sourceinstance
WHERE 
a11.requested_start_on_c  <> CONVERT_TZ(a12.u_requested_start, 'GMT', 'America/Los_Angeles')
)E;