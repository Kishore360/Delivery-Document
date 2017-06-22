
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt 
from gilead_mdwdb.d_request_task a
inner join gilead_mdsdb.sc_task_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
where a.hold_until_c<>CONVERT_TZ(b.u_on_hold_until,'GMT','America/New_York')) c;
