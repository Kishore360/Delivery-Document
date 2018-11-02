SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.serial_number_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance, serial_number from nbcu_mdsdb.cmdb_ci_final) SRC
left join  nbcu_mdwdb.d_configuration_item  TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where TRGT.soft_deleted_flag<>'Y' and 
coalesce(SRC.serial_number,'UNSPECIFIED') <> TRGT.serial_number_c) temp;