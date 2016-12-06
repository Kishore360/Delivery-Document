SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt

from bbandt_mdsdb.change_request_final a

 join bbandt_mdwdb.f_change_request b

on a.sys_id=b.row_id and
a.sourceinstance=b.source_id

left join bbandt_mdwdb.d_internal_contact d
on concta('INTERNAL_CONTACT~',a.u_group_coordinated_with)=d.row_id 
where coalesce(d.row_key,case when u_group_coordinated_with is null then 0 else -1 end) <>b.group_coordinated_with_c_key) a;

