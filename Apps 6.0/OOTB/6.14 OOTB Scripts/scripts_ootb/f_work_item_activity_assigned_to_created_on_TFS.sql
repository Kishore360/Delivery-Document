SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.assigned_to_created_on' ELSE 'SUCCESS' END as Message
 from (
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
 and SQ.sourceinstance=DWI.sourceinstance
 ) SRC
 left join #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 on  CONCAT(LPAD(SRC.System_Id,50,0) , '~', LPAD(SRC.TeamProjectSK, 50, 0) ,'~', TRGT.task_attribute_wh_name, '~', LPAD(SRC.System_Rev, 50, 0)) = TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
left join 
(	
	SELECT curr.system_id, curr.teamprojectsk, min(curr.system_rev) rev_no, curr.system_assignedto__personsk as curr_asgn, prev.system_assignedto__personsk as prev_asgn,curr.sourceinstance,
  CONVERT_TZ(curr.system_createddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') system_createddate, CONVERT_TZ(curr.system_changeddate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') system_changeddate
	FROM #MDS_TABLE_SCHEMA.dimworkitem_final curr
	JOIN #MDS_TABLE_SCHEMA.dimworkitem_final prev on curr.teamprojectsk = prev.teamprojectsk and curr.system_id = prev.system_id and curr.system_rev = prev.system_rev+1 and curr.sourceinstance=prev.sourceinstance
	WHERE coalesce(curr.system_assignedto__personsk, 0) <> coalesce(prev.system_assignedto__personsk, 0)
	GROUP BY curr.system_id, curr.teamprojectsk, curr.system_assignedto__personsk, prev.system_assignedto__personsk, curr.system_createddate, curr.system_changeddate
) asgn 
on concat(asgn.system_id, '~', asgn.teamprojectsk, '~', TRGT.task_attribute_wh_name, '~', asgn.rev_no) = CONCAT(SRC.system_id, '~', SRC.teamprojectsk, '~', TRGT.task_attribute_wh_name, '~', SRC.system_rev)
and asgn.sourceinstance=SRC.sourceinstance
 -- where coalesce(asgn.system_createddate,'') <>coalesce(TRGT.assigned_to_created_on,'');
 where coalesce(null,'') <>coalesce(TRGT.assigned_to_created_on,'');