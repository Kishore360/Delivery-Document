SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

ucsf_mdsdb.cmn_department_final a
join ucsf_mdsdb.cmn_department_final b
on a.parent=b.sys_id
left join ucsf_mdwdb.d_internal_organization c
on right(c.row_id,32)=a.sys_id and a.sourceinstance=c.source_id
where coalesce(b.u_level_2_parent_name,'UNSPECIFIED')<>c.grand_parent_name_c;