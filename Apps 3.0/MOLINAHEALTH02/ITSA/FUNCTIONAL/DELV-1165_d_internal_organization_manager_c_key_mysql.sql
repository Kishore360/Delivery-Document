SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt from molinahealth_mdwdb.d_internal_organization a
left join molinahealth_mdsdb.sys_user_group_final b
on a.row_id=concat('GROUP~',b.sys_id)
and a.source_id=b.sourceinstance
left join molinahealth_mdwdb.d_internal_contact c
on c.row_id=concat('INTERNAL_CONTACT~',b.manager)
where a.manager_c_key<>c.row_key
) a;	