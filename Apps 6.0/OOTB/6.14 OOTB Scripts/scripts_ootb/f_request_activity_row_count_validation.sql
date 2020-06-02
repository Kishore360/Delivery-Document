select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_request_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_request_activity TGT join #DWH_TABLE_SCHEMA.f_request F on F.request_key = TGT.request_key 
where F.soft_deleted_flag = 'N' and TGT.soft_deleted_flag = 'N') A, 
(select count(*)*2 count_2 from #DWH_TABLE_SCHEMA.f_request F join #DWH_TABLE_SCHEMA.d_request D on D.row_key = F.request_key 
where F.soft_deleted_flag = 'N') B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC join #DWH_TABLE_SCHEMA.f_request F on F.row_id = SRC.documentkey 
where SRC.tablename = 'sc_request' and SRC.fieldname in ('request_state', 'stage') and F.soft_deleted_flag = 'N') C
where count_1 <> (count_2+count_3)) SQ;