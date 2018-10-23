SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT Count(1) as CNT
from
nbcu_mdsdb.cmdb_ci_appl_final SRC 
join nbcu_mdwdb.d_configuration_item TRGT
on TRGT.row_id = SRC.sys_id AND TRGT.source_id = SRC.sourceinstance
where coalesce(SRC.install_status,'UNSPECIFIED') <> TRGT.status_c
)temp;