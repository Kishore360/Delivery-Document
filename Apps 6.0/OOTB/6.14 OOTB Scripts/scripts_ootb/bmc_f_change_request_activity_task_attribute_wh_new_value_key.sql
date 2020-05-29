select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for task_attribute_wh_new_value_key' ELSE 'SUCCESS' END as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_change_request_activity TGT
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = TGT.change_request_key
left join #DWH_TABLE_SCHEMA.f_change_request F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join (SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT2
on (F.change_request_key=TGT2.change_request_key AND SRC.sourceinstance=TGT2.source_id and TGT2.primary_sequence_id = 1)
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = concat('STATE~CHANGE_REQUEST~',coalesce(TGT2.task_attribute_wh_old_value, F.state_src_code)) and LOV.dimension_class = 'state~change_request'
where TGT.primary_sequence_id = 0 and F.soft_deleted_flag = 'N'
and COALESCE(TGT2.task_attribute_wh_old_value_key,LOV.row_key) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
union 
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final SRC
join (select max(etl_run_number) as etl_run_no FROM #STG_TABLE_SCHEMA.chg_infrastructure_change_sys_audit WHERE CDCTYPE<>'D') etl_run_no on etl_run_no.etl_run_no = SRC.etl_run_number
WHERE CDCTYPE<>'D') SRC
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
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov inc_state 
ON  inc_state.row_id=case when SUBSTRING(SRC.newvalue,1,249) is null then 'UNSPECIFIED' ELSE CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(LKP_SRC.enumId)) end
AND inc_state.source_id=case when SUBSTRING(SRC.newvalue,1,249) is null then 0 else LKP_SRC.sourceinstance end
where TGT.primary_sequence_id <> 0 and TGT.task_attribute_wh_name = 'state' and
COALESCE(inc_state.row_key, -1) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
union 
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final SRC
join (select max(etl_run_number) as etl_run_no FROM #STG_TABLE_SCHEMA.chg_infrastructure_change_sys_audit WHERE CDCTYPE<>'D') etl_run_no on etl_run_no.etl_run_no = SRC.etl_run_number
WHERE CDCTYPE<>'D') SRC
left join 
(
select Support_Group_Name, Support_Group_ID, sourceinstance
from #MDS_TABLE_SCHEMA.bmc_ctm_support_group_final
) LKP_SRC
on SUBSTRING(SRC.newvalue,1,249) = LKP_SRC.Support_Group_Name and SRC.sourceinstance = LKP_SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization org
ON  org.row_id=case when SUBSTRING(SRC.newvalue,1,249) is null then 'UNSPECIFIED' ELSE concat('GROUP~',LKP_SRC.Support_Group_ID) end
AND org.source_id = case when SUBSTRING(SRC.newvalue,1,249) is null then 0 else LKP_SRC.sourceinstance end 
where TGT.primary_sequence_id <> 0 and TGT.task_attribute_wh_name = 'assignment_group' and
COALESCE(org.row_key, -1) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
) SQ