SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from ucsf_mdsdb.change_request_final a
left join ucsf_mdwdb.d_change_request b
on a.sys_id=b.row_id and 
a.sourceinstance=b.source_id
where a.u_change_result<>b.change_result_src_code_c;