SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.reassigned_flag' ELSE 'SUCCESS' END as Message
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

 LEFT JOIN 
(
select system_id, teamprojectsk,sourceinstance, count(rev_no) reassignment_count from (
 SELECT CWI.system_id
  , CWI.teamprojectsk
  , max(CWI.system_rev) rev_no
  , CWI.system_assignedto__personsk as currently_assigned_to
  , PWI.system_assignedto__personsk as previously_assigned_to,CWI.sourceinstance
 FROM #MDS_TABLE_SCHEMA.dimworkitem_final CWI
 JOIN #MDS_TABLE_SCHEMA.dimworkitem_final PWI on CWI.teamprojectsk = PWI.teamprojectsk and CWI.system_id =PWI.system_id and CWI.system_rev = PWI.system_rev -1 and CWI.sourceinstance=PWI.sourceinstance
 WHERE coalesce(CWI.system_assignedto__personsk, 0) <> coalesce(PWI.system_assignedto__personsk, 0)
 and CWI.system_assignedto__personsk is not null
 GROUP BY CWI.system_id, CWI.teamprojectsk,CWI.system_assignedto__personsk, PWI.system_assignedto__personsk) t
group by system_id, teamprojectsk,sourceinstance
) REASSGN
on SRC.system_id = REASSGN.system_id and SRC.teamprojectsk = REASSGN.teamprojectsk and SRC.sourceinstance=REASSGN.sourceinstance
WHERE coalesce(case when REASSGN.reassignment_count > 0 then 'Y' else 'N' end, 'N') <> coalesce(TRGT.reassigned_flag,'');