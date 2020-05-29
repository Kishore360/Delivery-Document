select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_request_item_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_request_item_activity TGT join #DWH_TABLE_SCHEMA.f_request_item F on F.request_item_key = TGT.request_item_key 
where F.soft_deleted_flag = 'N' and TGT.soft_deleted_flag = 'N') A, 
(select count(*)*2 count_2 from #DWH_TABLE_SCHEMA.f_request_item F join #DWH_TABLE_SCHEMA.d_request_item D on D.row_key = F.request_item_key 
where F.soft_deleted_flag = 'N') B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC join #DWH_TABLE_SCHEMA.f_request_item F on F.row_id = SRC.documentkey 
where SRC.tablename = 'sc_req_item' and SRC.fieldname in ('state', 'stage') and F.soft_deleted_flag = 'N') C
where count_1 <> (count_2+count_3)) SQ;