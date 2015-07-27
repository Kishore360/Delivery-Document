SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from

uclahealth_mdsdb.sys_user_group_final a
left join 
uclahealth_mdwdb.d_internal_contact b 
on concat('INTERNAL_CONTACT~',left(a.u_queue_manager,32))=b.row_id
left join 
uclahealth_mdwdb.d_internal_organization c
on b.source_id=c.source_id and b.row_id=c.row_id
where c.queue_manager_c_key<>b.row_key

)E;