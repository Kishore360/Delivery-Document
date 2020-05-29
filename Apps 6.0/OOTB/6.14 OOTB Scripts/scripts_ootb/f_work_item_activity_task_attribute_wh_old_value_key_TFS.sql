SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.task_attribute_wh_old_value_key' ELSE 'SUCCESS' END as Message
from (
select TRGT.row_id
from (
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
 ) SRC 
 
 left join #DWH_TABLE_SCHEMA.d_lov LM
 on LM.row_id = concat('STATUS~WORK_ITEM~', SRC.prev_state) and LM.dimension_class = 'STATUS~WORK_ITEM'
 and LM.source_id=SRC.sourceinstance
 left join #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 on  CONCAT(LPAD(SRC.System_Id,50,0) , '~', LPAD(SRC.TeamProjectSK, 50, 0) ,'~', TRGT.task_attribute_wh_name, '~', LPAD(SRC.System_Rev, 50, 0)) = TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
  
 where TRGT.task_attribute_wh_name in ('STATUS') and TRGT.primary_sequence_id <> 0 and 
 coalesce(LM.row_key, case when SRC.prev_state is null then 0 else -1 end) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
 union all
 select TRGT.row_id
 from #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 where TRGT.primary_sequence_id = 0 and 
 coalesce(0, 0) <>coalesce(TRGT.task_attribute_wh_old_value_key,'')
 )SQ;