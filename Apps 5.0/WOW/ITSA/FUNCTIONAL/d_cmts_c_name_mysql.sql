SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from wow_mdsdb.u_cmts_final s
left join wow_mdwdb.d_cmts_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
where s.name <> t.name) temp;