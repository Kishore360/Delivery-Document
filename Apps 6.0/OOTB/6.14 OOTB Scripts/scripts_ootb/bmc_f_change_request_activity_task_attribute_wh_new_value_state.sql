select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_request_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_change_request_activity TGT
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = TGT.change_request_key
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT2
on (TGT.change_request_key=TGT2.change_request_key and TGT2.primary_sequence_id = 1 and TGT2.task_attribute_wh_name = 'state')
where
 TGT.primary_sequence_id = 0  and D.soft_deleted_flag = 'N'
 and TGT.task_attribute_wh_name = 'state'
-- and COALESCE(TGT2.task_attribute_wh_old_value,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
and COALESCE(null,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from (SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join 
(
SELECT enum_values.value,enum_values.enumId,enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.bmc_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.bmc_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId)
JOIN #MDS_TABLE_SCHEMA.bmc_arschema_final schma ON(field.schemaId=schma.schemaId and schma.overlaygroup=0) 
where field.fieldName ='Status' AND schma.NAME='CHG:ChangeInterface_Create'
) LKP_SRC
on SUBSTRING(SRC.newvalue,1,249) = LKP_SRC.value and SRC.sourceinstance = LKP_SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.task_attribute_wh_name = 'state' and
COALESCE(LKP_SRC.enumId, '') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ