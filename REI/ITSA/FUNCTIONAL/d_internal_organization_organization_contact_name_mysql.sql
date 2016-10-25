SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from rei_mdwdb.d_internal_organization a 
join rei_mdsdb.sys_user_group_final b 
ON a.row_id = CONCAT('GROUP~',b.sys_id) AND a.source_id = b.sourceinstance
join
rei_mdsdb.sys_user_final c
on (b.manager=c.sys_id) 
where COALESCE(concat(c.first_name,' ',c.last_name),'UNSPECIFIED')<>a.organization_contact_name)c ;