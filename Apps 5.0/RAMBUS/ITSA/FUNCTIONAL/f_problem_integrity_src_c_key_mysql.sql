SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(*) as cnt
from rambus_mdwdb.f_problem a
inner join rambus_mdsdb.problem_final b
on a.row_id=b.sys_id and
a.source_id=b.sourceinstance
left join rambus_mdwdb.d_lov c
on c.row_id=CONCAT('INTEGRITY_C','~','PROBLEM','~','~','~',UPPER(b.u_integrity))
where a.integrity_src_c_key<>c.row_key) z;