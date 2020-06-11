select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_change_request_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_change_request_activity TGT join #DWH_TABLE_SCHEMA.f_change_request F on F.change_request_key = TGT.change_request_key 
where F.soft_deleted_flag = 'N' and TGT.soft_deleted_flag = 'N') A, 
(select count(*) count_2 from #DWH_TABLE_SCHEMA.f_change_request F join #DWH_TABLE_SCHEMA.d_change_request D on D.row_key = F.change_request_key 
where F.soft_deleted_flag = 'N') B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') SRC join #DWH_TABLE_SCHEMA.f_change_request F on F.row_id = SRC.documentkey 
where SRC.tablename = 'change_request' and SRC.fieldname in ('state') and F.soft_deleted_flag = 'N') C
where count_1 <> (count_2+count_3)) SQ;