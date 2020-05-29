use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join 
(
select tmp.issueid, tmp.sourceinstance, LM.dimension_wh_code, tmp.authorRef, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'
where tmp.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
) closed
on closed.issueid = temp.issueid and closed.sourceinstance = temp.sourceinstance
and temp.completed_on = closed.created
set temp.closed_by = case when temp.`status` not in ('COMPLETED') then NULL
when temp.`status`='COMPLETED' then closed.authorRef
when ASCII(COALESCE(closed.authorRef,'')) = 0 THEN NULL else 'UNKNOWN' end;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join 
(
select tmp.issueid, tmp.sourceinstance, tmp.authorRef, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on lower(tmp.field) = 'status' and concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on lower(tmp.field) = 'resolution' and concat('RESOLUTION~WORK_ITEM~',upper(tmp.to))=RES.src_rowid and tmp.sourceinstance = RES.source_id and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
 
where (LM.dimension_wh_code = 'CANCELLED' or RES.dimension_wh_code in ('CANCELLED')) and tmp.primary_sequence_id <>0
) cncld_by
on cncld_by.issueid = temp.issueid and cncld_by.sourceinstance = temp.sourceinstance
and temp.cancelled_on_calc = cncld_by.created
set temp.cancelled_by = case when temp.`status` in ('CANCELLED') and (temp.resolution != 'CANCELLED' OR temp.resolution IS NULL) then cncld_by.authorRef
when temp.`status` in ('RESOLVED', 'COMPLETED', 'CANCELLED') then case when temp.resolution in ('CANCELLED') then coalesce(temp.resolved_by, temp.closed_by, cncld_by.authorRef) else NULL end
when temp.`status` not in ('RESOLVED', 'COMPLETED', 'CANCELLED') THEN NULL
when ASCII(COALESCE(cncld_by.authorRef,'')) = 0 THEN NULL
else 'UNKNOWN' end;