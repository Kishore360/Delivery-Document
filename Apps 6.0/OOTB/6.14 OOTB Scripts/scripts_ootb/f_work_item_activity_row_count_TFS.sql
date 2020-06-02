select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_work_item_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'TFS_DWS') ODF 
on ODF.source_id = TRGT.source_id
where TRGT.soft_deleted_flag = 'N' and TRGT.row_key not in (0,-1) and TRGT.task_attribute_wh_name = 'STATUS' -- where TRGT.soft_deleted_flag = 'N'
) A, 
(select count(*) count_2 
FROM  (
 select DWI.*, SQ.prev_state as prev_state
 from #MDS_TABLE_SCHEMA.dimworkitem_final DWI
 join 
 (
select base.system_id, base.teamprojectsk, base.sourceinstance, prev.System_State prev_state, base.System_State current_state, /*next.System_State next_state,*/ base.System_Rev sys_rev
 from #MDS_TABLE_SCHEMA.dimworkitem_final base 
 left join #MDS_TABLE_SCHEMA.dimworkitem_final next
 on base.system_id = next.system_id and base.teamprojectsk = next.teamprojectsk 
 and base.sourceinstance = next.sourceinstance and base.system_rev + 1 = next.system_rev and next.System_State!=base.System_State
 left join #MDS_TABLE_SCHEMA.dimworkitem_final prev
 on base.system_id = prev.system_id and base.teamprojectsk = prev.teamprojectsk 
 and base.sourceinstance = prev.sourceinstance and base.system_rev = prev.system_rev + 1 and prev.System_State!=base.System_State
 where prev.System_State is not null 
 union all
 select base.system_id, base.teamprojectsk, base.sourceinstance, null as prev_state, base.System_State current_state, /*next.System_State next_state,*/ base.System_Rev sys_rev
 from #MDS_TABLE_SCHEMA.dimworkitem_final base 
 where base.System_Rev = 1
 ) SQ
 on SQ.System_Id = DWI.System_Id and SQ.TeamProjectSK = DWI.TeamProjectSK 
 and SQ.current_state = DWI.System_State and SQ.sys_rev = DWI.System_Rev
 and DWI.sourceinstance=SQ.sourceinstance
 ) SRC  ) B
where count_1 <> count_2) SQ;