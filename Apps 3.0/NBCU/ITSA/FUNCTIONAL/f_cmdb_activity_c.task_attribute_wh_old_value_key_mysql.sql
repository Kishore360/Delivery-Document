SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.task_attribute_wh_new_value_key' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from nbcu_mdsdb.sys_audit_final SRC
 left join nbcu_mdwdb.d_lov LKP on concat('OPERATIONAL_STATUS_C~CONFIGURATION_ITEM~~~',SRC.oldvalue)=LKP.row_id and  SRC.sourceinstance=LKP.Source_id
left join  nbcu_mdwdb.f_cmdb_activity_c  TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where TRGT.soft_deleted_flag<>'Y' and 
coalesce(LKP.row_key, case when SRC.oldvalue is null then 0 else -1 end) <> TRGT.task_attribute_wh_new_value_key) temp;