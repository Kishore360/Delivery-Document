/*DELV-1166*/

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt from 
(select d.row_key row_key,b.sys_id as sys_id,b.sourceinstance sourceinstance,b.manager manager,
c.department_code department_code,
COALESCE(CONCAT('INTERNAL_CONTACT~',b.manager),'UNSPECIFIED') as a11,c.row_id as a1,
d.row_id as a2,COALESCE(CONCAT('DEPARTMENT~',c.department_code),'UNSPECIFIED') as a12
from molinahealth_mdsdb.sys_user_group_final b 
left join molinahealth_mdwdb.d_internal_contact c
ON COALESCE(CONCAT('INTERNAL_CONTACT~',b.manager),'UNSPECIFIED')=c.row_id
AND c.source_id=b.sourceinstance
LEFT JOIN molinahealth_mdwdb.d_internal_organization d
ON d.row_id=COALESCE(CONCAT('DEPARTMENT~',c.department_code),'UNSPECIFIED')
AND c.source_id=d.source_id
)aa
join
(select department_c_key,row_id,source_id from molinahealth_mdwdb.d_internal_organization) bc
on (bc.row_id=(CONCAT('GROUP~',aa.sys_id)) AND bc.source_id=aa.sourceinstance)
where coalesce(aa.row_key,case when aa.manager  or aa.department_code is null then 0 else -1 end )<> bc.department_c_key)a

