SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.cost_center_c_key' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance, cost_center from nbcu_mdsdb.cmdb_ci_final) SRC
left join nbcu_mdsdb.cmn_cost_center_final SRC1 on SRC.cost_center=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
 left join nbcu_mdwdb.d_cost_center LKP on SRC1.sys_id=LKP.row_id and SRC1.sourceinstance=LKP.source_id
left join  nbcu_mdwdb.d_configuration_item  TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where TRGT.soft_deleted_flag<>'Y' and 
coalesce(LKP.row_key, case when SRC.cost_center is null then 0 else -1 end) <> TRGT.cost_center_c_key) temp;