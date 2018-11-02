SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.name' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance,u_operational_status from nbcu_mdsdb.cmdb_ci_final) SRC
left join (select * from nbcu_mdwdb.d_configuration_item where soft_deleted_flag<>'Y') TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
-- left join (select task_attribute_wh_new_value, source_id from nbcu_mdwdb.f_cmdb_activity_c) TRGT1
-- on concat('OPERATIONAL_STATUS_C~CONFIGURATION_ITEM~~~',SRC.u_operational_status)=TRGT1.task_attribute_wh_new_value and SRC.sourceinstance=TRGT1.source_id
left join nbcu_mdwdb.d_lov LKP on concat('OPERATIONAL_STATUS_C~CONFIGURATION_ITEM~~~',SRC.u_operational_status)= LKP.row_id
where coalesce(LKP.row_key,case when SRC.u_operational_status is null then 0 else -1 end)<>TRGT.operational_status_c_key) temp;