select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_change_task_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_change_task_activity TGT where TGT.soft_deleted_flag = 'N') A, 
(select count(*) count_2 from #DWH_TABLE_SCHEMA.f_change_task F where F.soft_deleted_flag = 'N' and F.change_task_key <> -1) B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC where SRC.tablename = 'change_task' and SRC.fieldname='state') C
where count_1 <> (count_2+count_3)) SQ;