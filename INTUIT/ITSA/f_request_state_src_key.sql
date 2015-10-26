
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.sc_request_final a 
left join intuit_mdwdb.f_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join intuit_mdwdb.d_lov c
on c.row_id=COALESCE(CONCAT('REQUEST_STATE','~','SC_REQUEST','~','~','~',UPPER(a.state)),'UNSPECIFIED') and a.sourceinstance=c.source_id
where c.row_key <> b.state_src_key
) g