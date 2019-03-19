SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.application_id_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance from nbcu_mdsdb.cmdb_ci_final) SRC
 left join nbcu_mdsdb.cmdb_ci_appl_final SRC1
 on SRC.sourceinstance=SRC1.sourceinstance and SRC.sys_id=SRC1.sys_id
left join  nbcu_mdwdb.d_configuration_item  TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where TRGT.soft_deleted_flag<>'Y' and  SRC1.u_application_id <> TRGT.application_id_c) temp;