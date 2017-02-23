SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.change_request_final a
join cardinalhealth_mdwdb.f_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.subcategory_src_code_c <> a.u_subcategory)temp;
