SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

ucsf_mdsdb.cmn_department_delta a
join ucsf_mdwdb.d_internal_organization b
on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id and b.department_flag='Y'
where a.id<>b.legal_name;