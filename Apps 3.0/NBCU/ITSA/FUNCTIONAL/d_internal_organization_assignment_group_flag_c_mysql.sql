SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdsdb.sys_user_group_final a
join nbcu_mdwdb.d_internal_organization b
ON right(b.row_id,32) = a.sys_id AND b.source_id = a.sourceinstance
where 
CASE WHEN (a.u_assignment = 1) THEN 'Y' else 'N' END<>b.assignment_group_flag_c