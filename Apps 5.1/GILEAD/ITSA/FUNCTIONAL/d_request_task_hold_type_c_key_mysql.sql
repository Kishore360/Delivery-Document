SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt 
from gilead_mdwdb.d_request_task a
inner join gilead_mdsdb.sc_task_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join gilead_mdwdb.d_lov c
on CONCAT('HOLD_TYPE','~','SC_TASK','~','~','~',UPPER(b.u_hold_type))=c.row_id
AND c.source_id=b.sourceinstance
where c.row_key<>a.hold_type_c_key) c;