SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from rei_mdwdb.d_internal_organization a 
join rei_mdsdb.sys_user_group_final b 
ON a.row_id = CONCAT('GROUP~',b.sys_id) AND a.source_id = b.sourceinstance
join
rei_mdwdb.d_internal_contact  lkp
 ON COALESCE(CONCAT('INTERNAL_CONTACT~',b.manager),'UNSPECIFIED') = lkp.row_id AND lkp.source_id = a.source_id
where COALESCE(lkp.row_key,case when b.manager is null then 0 else -1 end)<> a.manager_c_key)c ;