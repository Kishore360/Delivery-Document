SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aruba_mdwdb.d_request_item a 
JOIN aruba_mdsdb.sc_req_item_final c 
 ON a.row_id = c.sys_id AND a.source_id = c.sourceinstance 
LEFT JOIN aruba_mdsdb.sc_request_final b 
 ON b.sys_id = c.request AND b.sourceinstance = c.sourceinstance 
where  a.new_hire_c_flag <> CASE WHEN b.u_new_hire_start_date IS NOT NULL THEN 'Y' ELSE 'N' END;