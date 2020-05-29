SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.duration' ELSE 'SUCCESS' END as Message
 from (
 select DWI.*
 from #MDS_TABLE_SCHEMA.dimworkitem_final DWI
 join 
 (
 select WI.system_id, WI.teamprojectsk, WI.PreviousState, WI.System_State, min(WI.System_Rev) rev_no
 from #MDS_TABLE_SCHEMA.dimworkitem_final WI
 group by WI.system_id, WI.teamprojectsk, WI.PreviousState, WI.System_State
 ) SQ
 on SQ.System_Id = DWI.System_Id and SQ.TeamProjectSK = DWI.TeamProjectSK 
 and SQ.System_State = DWI.System_State and SQ.rev_no = DWI.System_Rev
 ) SRC
 left join #DWH_TABLE_SCHEMA.f_work_item_activity TRGT
 on  CONCAT(LPAD(SRC.System_Id,50,0) , '~', LPAD(SRC.TeamProjectSK, 50, 0) ,'~', TRGT.task_attribute_wh_name, '~', LPAD(SRC.System_Rev, 50, 0)) = TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 left join 
(	
	SELECT curr.system_id, curr.teamprojectsk, min(curr.system_rev) rev_no, curr.system_assignedto__personsk as curr_asgn, prev.system_assignedto__personsk as prev_asgn, 
  curr.system_createddate system_createddate, curr.system_reviseddate system_reviseddate
	FROM #MDS_TABLE_SCHEMA.dimworkitem_final curr
	JOIN #MDS_TABLE_SCHEMA.dimworkitem_final prev on curr.teamprojectsk = prev.teamprojectsk and curr.system_id = prev.system_id and curr.system_rev = prev.system_rev+1
	WHERE coalesce(curr.system_assignedto__personsk, 0) <> coalesce(prev.system_assignedto__personsk, 0)
	GROUP BY curr.system_id, curr.teamprojectsk, curr.system_assignedto__personsk, prev.system_assignedto__personsk, curr.system_createddate, curr.system_reviseddate
) asgn 
on concat(asgn.system_id, '~', asgn.teamprojectsk, '~', TRGT.task_attribute_wh_name, '~', asgn.rev_no) = CONCAT(SRC.system_id, '~', SRC.teamprojectsk, '~', TRGT.task_attribute_wh_name, '~', SRC.system_rev)
  
 join #DWH_TABLE_SCHEMA.d_o_data_freshness odf on odf.source_id = SRC.sourceinstance
 
 where coalesce(timestampdiff(second,coalesce(greatest(asgn.system_createddate, SRC.system_createddate), SRC.system_createddate),
 coalesce(least(asgn.system_reviseddate, SRC.system_reviseddate), SRC.system_reviseddate)),0) <> coalesce(TRGT.duration,'');