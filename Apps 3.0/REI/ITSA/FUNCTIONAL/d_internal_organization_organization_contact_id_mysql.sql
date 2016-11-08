SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_internal_organization a 
INNER JOIN 
rei_mdsdb.sys_user_group_final b 
ON (a.row_id = CONCAT('GROUP~',b.sys_id) )
where COALESCE(b.manager,'UNSPECIFIED')<> a.organization_contact_id)a