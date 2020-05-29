select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_case_activity.task_attribute_wh_old_value_key' else 'SUCCESS' end as Message
from 
(
select SRC.sys_id, SRC.oldvalue, LOV.row_key, F.case_key, F.soft_deleted_flag,
TGT.task_wh_type, TGT.task_attribute_wh_name,
coalesce(LOV.row_key,case when SRC.oldvalue is null then 0 else -1 end) sr,
coalesce(TGT.task_attribute_wh_old_value_key, '') tg
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D' and tablename = 'sn_customerservice_case') SRC
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = coalesce(concat('STATE~CASE~',SRC.oldvalue),'UNSPECIFIED')
and LOV.dimension_class = 'STATE~CASE' and LOV.source_id = SRC.sourceinstance 
left join #DWH_TABLE_SCHEMA.f_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.f_case F
on F.case_key = TGT.case_key and F.source_id = TGT.source_id
where SRC.fieldname = 'state' and F.soft_deleted_flag = 'N' and
coalesce(LOV.row_key,case when SRC.oldvalue is null then 0 else -1 end) <>coalesce(TGT.task_attribute_wh_old_value_key, '')

union all

select SRC.sys_id, SRC.oldvalue, DIO.row_key, F.case_key, F.soft_deleted_flag,
TGT.task_wh_type, TGT.task_attribute_wh_name,
coalesce(DIO.row_key, case when SRC.oldvalue is null then 0 else -1 end) sr,
coalesce(TGT.task_attribute_wh_old_value_key, '') tg
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D' and tablename = 'sn_customerservice_case') SRC
left join #DWH_TABLE_SCHEMA.d_internal_organization DIO
on DIO.row_id = coalesce(concat('GROUP~',SRC.oldvalue),'UNSPECIFIED')
and DIO.source_id = SRC.sourceinstance 
left join #DWH_TABLE_SCHEMA.f_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.f_case F
on F.case_key = TGT.case_key and F.source_id = TGT.source_id
where SRC.fieldname = 'assignment_group' and F.soft_deleted_flag = 'N' and
coalesce(DIO.row_key, case when SRC.oldvalue is null then 0 else -1 end) <> coalesce(TGT.task_attribute_wh_old_value_key, '')
)SQ;