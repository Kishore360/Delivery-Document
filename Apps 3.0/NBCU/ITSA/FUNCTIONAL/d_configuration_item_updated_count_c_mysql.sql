SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.name' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance,sys_mod_count from nbcu_mdsdb.cmdb_ci_final) SRC
left join (select * from nbcu_mdwdb.d_configuration_item where soft_deleted_flag<>'Y') TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where SRC.sys_mod_count<>TRGT.updated_count_c) temp;