select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.group_created_on' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_item_activity TGT
left join #DWH_TABLE_SCHEMA.f_request_item F 
on F.request_item_key = TGT.request_item_key
and F.soft_deleted_flag = 'N'
left join #DWH_TABLE_SCHEMA.d_request_item D 
on F.request_item_key = D.row_key
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id and SRC.sourceinstance=F.source_id
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and COALESCE(case when TGT.task_attribute_wh_name = 'assignment_group' then D.opened_on else null end,'') <> COALESCE(TGT.group_created_on,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and TGT.task_attribute_wh_name = 'assignment_group'
and COALESCE(convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')  <> COALESCE(TGT.group_created_on,'') 
/*union all
NOT FUTURE READY for others
*/
) SQ;