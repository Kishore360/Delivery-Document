select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = TGT.incident_key
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT2
on (TGT.incident_key=TGT2.incident_key and TGT2.primary_sequence_id = 1 and TGT2.task_attribute_wh_name = 'state')
where
 TGT.primary_sequence_id = 0  and D.soft_deleted_flag = 'N'
 and TGT.task_attribute_wh_name = 'state'
 -- and COALESCE(TGT2.task_attribute_wh_old_value,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
 and COALESCE(null,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final SRC
join (select max(etl_run_number) as etl_run_no FROM #STG_TABLE_SCHEMA.hpd_help_desk_sys_audit WHERE CDCTYPE<>'D') etl_run_no on etl_run_no.etl_run_no = SRC.etl_run_number WHERE CDCTYPE<>'D') SRC
left join 
(
SELECT enum_values.value,enum_values.enumId,enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.bmc_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.bmc_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId)
JOIN #MDS_TABLE_SCHEMA.bmc_arschema_final schma ON(field.schemaId=schma.schemaId and schma.overlaygroup=0) 
where field.fieldName ='Status' AND schma.NAME='HPD:Help Desk'
) LKP_SRC
on SUBSTRING(SRC.newvalue,1,249) = LKP_SRC.value and SRC.sourceinstance = LKP_SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.task_attribute_wh_name = 'state' and
COALESCE(LKP_SRC.enumId, '') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ