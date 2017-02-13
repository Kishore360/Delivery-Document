SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_change_request b
JOIN cardinalhealth_mdsdb.change_request_final a on b.row_id = a.sys_id and b.source_id= a.sourceinstance
where b.were_deployment_steps_executed_c_flag <> CASE WHEN a.u_were_the_deployment_steps_ex = 'Yes' THEN 'Y' 
WHEN a.u_were_the_deployment_steps_ex = 'No' THEN 'N' ELSE a.u_were_the_deployment_steps_ex END;