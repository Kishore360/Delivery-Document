SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.reassignment_count' ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_id, SRC.system_id, SRC.teamprojectsk, SRC.sourceinstance, coalesce(REASSGN.reassignment_count, 0), TRGT.reassignment_count*/
from
(
 select SRCD.*, SRCF.microsoft_vsts_scheduling_originalestimate, SRCF.microsoft_vsts_scheduling_remainingwork, SRCF.microsoft_vsts_scheduling_completedwork, SRCF.LastUpdatedDateTime lstupdt
 from #MDS_TABLE_SCHEMA.factcurrentworkitem_final SRCF
 left join #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 on SRCF.workitemsk = SRCD.workitemsk 
 join 
 ( 
 select base.system_id, base.teamprojectsk, base.sourceinstance,max(base.System_Rev) System_Rev 
 from #MDS_TABLE_SCHEMA.dimworkitem_final base 
 group by base.system_id, base.teamprojectsk, base.sourceinstance 
 ) curr 
 on SRCD.system_id = curr.system_id and SRCD.teamprojectsk = curr.teamprojectsk 
 and SRCD.sourceinstance = curr.sourceinstance and SRCD.system_rev = curr.system_rev
 ) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
ON (CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
left join
(
select SQ.system_id, SQ.teamprojectsk, SQ.sourceinstance, count(SQ.current_assignee) reassignment_count
from
(
select SRC.system_id, SRC.teamprojectsk, SRC.sourceinstance, SRC.system_rev, SRC.system_assignedto__personsk current_assignee, SRC_NEXT.system_assignedto__personsk next_assignee,
SRC_NEXT_NEXT.system_assignedto__personsk next_next_assignee
from #MDS_TABLE_SCHEMA.dimworkitem_final SRC
left join #MDS_TABLE_SCHEMA.dimworkitem_final SRC_NEXT
on SRC.system_id = SRC_NEXT.system_id and SRC.teamprojectsk = SRC_NEXT.teamprojectsk and SRC.sourceinstance = SRC_NEXT.sourceinstance and SRC.system_rev = SRC_NEXT.system_rev - 1
left join #MDS_TABLE_SCHEMA.dimworkitem_final SRC_NEXT_NEXT
on SRC_NEXT_NEXT.system_id = SRC_NEXT.system_id and SRC_NEXT_NEXT.teamprojectsk = SRC_NEXT.teamprojectsk and SRC_NEXT_NEXT.sourceinstance = SRC_NEXT.sourceinstance and SRC_NEXT_NEXT.system_rev = SRC_NEXT.system_rev + 1
where SRC.system_assignedto__personsk is not null
) SQ
where SQ.current_assignee <> coalesce(SQ.next_assignee,SQ.next_next_assignee)
group by SQ.system_id, SQ.teamprojectsk, SQ.sourceinstance
-- order by SQ.system_id, SQ.teamprojectsk, SQ.sourceinstance, SQ.system_rev
) REASSGN
ON (REASSGN.system_id = SRC.system_id and REASSGN.teamprojectsk = SRC.teamprojectsk 
AND REASSGN.sourceinstance=SRC.sourceinstance)
WHERE coalesce(REASSGN.reassignment_count, 0) <> coalesce(TRGT.reassignment_count,'');