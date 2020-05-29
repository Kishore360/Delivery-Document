SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.reopened_flag' ELSE 'SUCCESS' END as Message
FROM (
 select DWI.*, SQ.prev_state as prev_state, SQ.current_state as current_state
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
 ) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON ( CONCAT(LPAD(SRC.System_Id,50,0) , '~', LPAD(SRC.TeamProjectSK, 50, 0) ,'~', TRGT.task_attribute_wh_name, '~', LPAD(SRC.System_Rev, 50, 0)) = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
 left join
( 
select S.system_id, S.teamprojectsk, S.system_rev, S.sourceinstance, count(1) reopn_cnt
from #MDS_TABLE_SCHEMA.dimworkitem_final S
 left join #DWH_TABLE_SCHEMA.d_lov_map CLM
 on CLM.dimension_code = S.System_State and CLM.dimension_class = 'STATUS~WORK_ITEM' and CLM.source_id=S.sourceinstance
 left join #DWH_TABLE_SCHEMA.d_lov_map PLM
 on PLM.dimension_code = S.PreviousState and PLM.dimension_class = 'STATUS~WORK_ITEM' and PLM.source_id=S.source_id
 where CLM.dimension_wh_code in ('PROPOSED', 'IN PROGRESS') and PLM.dimension_wh_code in ('RESOLVED', 'COMPLETED')
 group by S.system_id, S.teamprojectsk, S.system_rev, S.sourceinstance
) reopen
on reopen.system_id = SRC.system_id and reopen.teamprojectsk = SRC.teamprojectsk and reopen.system_rev = SRC.system_rev
and reopen.sourceinstance=SRC.sourceinstance
WHERE coalesce(case when reopen.reopn_cnt > 0 then 'Y' else 'N' end, 'N') <> coalesce(TRGT.reopened_flag,'');