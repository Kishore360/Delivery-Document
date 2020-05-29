select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.request_item_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_item_activity TGT
left join #DWH_TABLE_SCHEMA.d_request_item D
on D.row_key = TGT.request_item_key
left join #DWH_TABLE_SCHEMA.f_request_item F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' and F.soft_deleted_flag = 'N'
and COALESCE(F.request_item_key,'') <> COALESCE(TGT.request_item_key,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item D
on D.row_id = SRC.documentkey
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(case when D.row_key is null and SRC.documentkey is null then 0
when D.row_key is null and SRC.documentkey is not null then -1
else D.row_key end,'') <> COALESCE(TGT.request_item_key,'')
) SQ;