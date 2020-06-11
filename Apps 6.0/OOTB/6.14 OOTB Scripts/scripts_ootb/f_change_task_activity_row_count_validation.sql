select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_change_task_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_change_task_activity TGT join #DWH_TABLE_SCHEMA.f_change_task F on F.change_task_key = TGT.change_task_key 
where TGT.change_task_key > 0 and TGT.soft_deleted_flag = 'N') A, 
(select count(*) * 2 count_2 from #DWH_TABLE_SCHEMA.f_change_task F join #DWH_TABLE_SCHEMA.d_change_task D on D.row_key = F.change_task_key 
where F.soft_deleted_flag = 'N') B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC join #DWH_TABLE_SCHEMA.f_change_task F on F.row_id = SRC.documentkey 
where SRC.tablename = 'change_task' and SRC.fieldname in ('state', 'assignment_group')) C
where count_1 <> (count_2+count_3)) SQ;