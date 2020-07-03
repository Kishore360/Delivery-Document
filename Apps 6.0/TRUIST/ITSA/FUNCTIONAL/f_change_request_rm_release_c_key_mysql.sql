SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt

from truist_mdsdb.change_request_final a

 join truist_mdwdb.f_change_request b

on a.sys_id=b.row_id and
a.sourceinstance=b.source_id

left join truist_mdwdb.d_rm_release_c d
on a.u_related_release=d.row_id and  a.sourceinstance=d.source_id
where coalesce(d.row_key,case when u_related_release is null then 0 else -1 end) <>b.rm_release_c_key) a;

