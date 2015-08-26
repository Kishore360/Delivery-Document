SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdwdb.d_internal_organization a
join ucsf_mdsdb.cmn_department_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
left join ucsf_mdwdb.d_internal_organization c
on coalesce(b.parent,'UNSPECIFIED')=right(c.row_id,32) and c.department_flag='Y'
where a.parent_c_key<>coalesce(c.row_key,0);