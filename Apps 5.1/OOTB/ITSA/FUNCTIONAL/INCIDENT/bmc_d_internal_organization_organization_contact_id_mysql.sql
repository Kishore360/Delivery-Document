SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END as Message from(select count(*) as cnt 
from
schneider_mdwdb.d_internal_organization a 
INNER JOIN 
schneider_mdsdb.ctm_people_organization_final b 
ON (a.row_id = CONCAT('DEPARTMENT~',b.sys_id) )
where COALESCE(b.department,'UNSPECIFIED')<> a.organization_contact_id)a
