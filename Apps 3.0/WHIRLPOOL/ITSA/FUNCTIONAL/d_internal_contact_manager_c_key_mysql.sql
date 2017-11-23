SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from whirlpool_mdsdb.sys_user_group_final a
left join 
 whirlpool_mdwdb.d_internal_contact b 
on concat('INTERNAL_CONTACT~',left(a.u_queue_manager,32))=b.row_id
 left join 
 whirlpool_mdwdb.d_internal_organization c
on a.sourceinstance=c.source_id and c.row_id=concat('GROUP~',a.sys_id)
  where c.manager_queue_c_key<>coalesce(b.row_key,case when u_queue_manager is null then 0 else -1 end)

)E;



