SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from rei_mdwdb.d_internal_contact a 
join rei_mdsdb.sys_user_final b 
ON a.row_id = CONCAT('INTERNAL_CONTACT~',b.sys_id) AND a.source_id = b.sourceinstance
join
rei_mdwdb.d_internal_organization LKP
on COALESCE(CONCAT('DEPARTMENT~',b.department),'UNSPECIFIED')= LKP.row_id and LKP.source_id= b.sourceinstance
where COALESCE( LKP.row_key,case when b.department  is null then 0 else -1 end) <> a.department_c_key)c ;