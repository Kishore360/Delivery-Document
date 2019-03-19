SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_change_request d
JOIN cardinalhealth_mdsdb.change_request_final i 
on d.row_id = i.sys_id and d.source_id= i.sourceinstance
where d.ccb_required_c_flag <> CASE WHEN i.u_ccb_required = 1 THEN  'Y' ELSE 'N' END;