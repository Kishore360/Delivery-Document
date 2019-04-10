SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(11) as CNT 
from
nbcu_mdwdb.d_configuration_item a 
INNER JOIN nbcu_mdsdb.cmdb_ci_appl_final b 
on a.row_id = b.sys_id AND a.source_id = b.sourceinstance
where a.ci_status_c <> case when  b.u_operational_status=1 then 'active' end
)temp;
