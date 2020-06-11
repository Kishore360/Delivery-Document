use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join (
select distinct tmp.issueid, tmp.sourceinstance, tmp.authorkey, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id
where tmp.field = 'STATUS' and tmp.primary_sequence_id <>0
) resolved_by
on resolved_by.issueid = temp.issueid and resolved_by.sourceinstance = temp.sourceinstance 
and temp.resolved_on_calc = resolved_by.created
set temp.resolved_by = case when temp.`status` not in ('RESOLVED', 'COMPLETED') then NULL
 when temp.`status` in ('RESOLVED', 'COMPLETED') and ASCII(COALESCE(resolved_by.authorkey,'')) = 0 THEN NULL 
 when temp.`status` in ('RESOLVED', 'COMPLETED') then resolved_by.authorkey else 'UNKNOWN' end;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join 
(
select tmp.issueid, tmp.sourceinstance, LM.dimension_wh_code, tmp.authorkey, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id
where tmp.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
) closed
on closed.issueid = temp.issueid and closed.sourceinstance = temp.sourceinstance
and temp.completed_on = closed.created
set temp.closed_by = case when temp.`status` not in ('COMPLETED') then NULL
when temp.`status`='COMPLETED' then closed.authorkey
when ASCII(COALESCE(closed.authorkey,'')) = 0 THEN NULL else 'UNKNOWN' end;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join 
(
select tmp.issueid, tmp.sourceinstance, tmp.authorkey, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on lower(tmp.field) = 'status' and concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id
 
where LM.dimension_wh_code = 'CANCELLED' and tmp.primary_sequence_id <>0
) cncld_by
on cncld_by.issueid = temp.issueid and cncld_by.sourceinstance = temp.sourceinstance
and temp.cancelled_on_calc = cncld_by.created
set temp.cancelled_by = case when temp.`status` in ('CANCELLED') and (temp.resolution != 'CANCELLED' OR temp.resolution IS NULL) then cncld_by.authorkey
when temp.`status` in ('RESOLVED', 'COMPLETED', 'CANCELLED') then case when temp.resolution in ('CANCELLED') then coalesce(temp.resolved_by, temp.closed_by, cncld_by.authorkey) else NULL end
when temp.`status` not in ('RESOLVED', 'COMPLETED', 'CANCELLED') THEN NULL
when ASCII(COALESCE(cncld_by.authorkey,'')) = 0 THEN NULL
else 'UNKNOWN' end;