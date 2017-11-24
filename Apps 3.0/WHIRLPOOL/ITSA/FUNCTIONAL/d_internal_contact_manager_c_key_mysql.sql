SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from whirlpool_mdsdb.sys_user_group_final a
left join whirlpool_mdsdb.sys_user_final d on (a.u_queue_manager)=d.sys_id
left join whirlpool_mdsdb.sys_user_final e on (d.manager)=e.sys_id  
left join whirlpool_mdwdb.d_internal_contact  b on b.row_id=concat('INTERNAL_CONTACT~',d.sys_id)
left join whirlpool_mdwdb.d_internal_contact c on c.row_id=concat('INTERNAL_CONTACT~',e.sys_id)
where b.manager_c_key<>coalesce(c.row_key,case when d.manager is null then 0 else -1 end)

)E;



