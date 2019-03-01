SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.application_id_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance,u_application_id from nbcu_mdsdb.cmdb_ci_appl) SRC
left join  nbcu_mdwdb.d_configuration_item  TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where SRC.u_application_id <> TRGT.application_id_c) temp;