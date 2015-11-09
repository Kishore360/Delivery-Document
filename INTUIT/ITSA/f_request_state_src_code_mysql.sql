SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.sc_request_final a 
left join intuit_mdwdb.f_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where  b.state_src_code <>   a.state
) g