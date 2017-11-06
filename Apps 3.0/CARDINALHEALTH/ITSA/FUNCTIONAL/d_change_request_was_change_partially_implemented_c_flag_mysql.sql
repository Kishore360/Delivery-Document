SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_change_request b
JOIN cardinalhealth_mdsdb.change_request_final a on b.row_id = a.sys_id and b.source_id= a.sourceinstance
where b.was_change_partially_implemented_c_flag <> 
CASE WHEN a.u_was_the_change_partially_imp = 'Yes' THEN 'Y' 
WHEN a.u_was_the_change_partially_imp = 'No' THEN 'N' ELSE a.u_was_the_change_partially_imp END;