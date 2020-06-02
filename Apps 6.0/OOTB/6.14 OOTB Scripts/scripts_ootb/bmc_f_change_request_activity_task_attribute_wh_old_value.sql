select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for task_attribute_wh_old_value' ELSE 'SUCCESS' END as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_change_request_activity TGT
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = TGT.change_request_key
where TGT.primary_sequence_id = 0
and COALESCE('','') <> COALESCE(TGT.task_attribute_wh_old_value,'')
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
on SUBSTRING(SRC.oldvalue,1,249) = LKP_SRC.value and SRC.sourceinstance = LKP_SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.task_attribute_wh_name = 'state' and
COALESCE(LKP_SRC.enumId, '') <> COALESCE(TGT.task_attribute_wh_old_value,'')

union 
select TGT.row_id
from (SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join 
(
select Support_Group_Name, Support_Group_ID, sourceinstance
from #MDS_TABLE_SCHEMA.bmc_ctm_support_group_final
) LKP_SRC
on SUBSTRING(SRC.oldvalue,1,249) = LKP_SRC.Support_Group_Name and SRC.sourceinstance = LKP_SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.task_attribute_wh_name = 'assignment_group' and
COALESCE(LKP_SRC.Support_Group_ID, '') <> COALESCE(TGT.task_attribute_wh_old_value,'')
) SQ