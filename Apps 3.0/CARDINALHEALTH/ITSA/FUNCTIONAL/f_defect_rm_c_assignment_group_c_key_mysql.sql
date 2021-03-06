SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT 
from
cardinalhealth_mdsdb.rm_defect_final a
join cardinalhealth_mdsdb.sys_user_final b
on b.sys_id=a.opened_by and a.sourceinstance=b.sourceinstance
left join cardinalhealth_mdwdb.f_defect_rm_c c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
left join cardinalhealth_mdwdb.d_internal_organization d
on d.row_id=case when coalesce(a.assignment_group,'UNSPECIFIED')='UNSPECIFIED' then 'UNSPECIFIED' else concat('GROUP~',a.assignment_group)end
and d.source_id=b.sourceinstance where d.row_key<>c.assignment_group_c_key)temp;
