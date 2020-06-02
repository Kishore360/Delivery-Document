use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join 
(
select FV.issueid, FV.sourceinstance, min(FV.id) earliest_fix_version_id
from #MDS_TABLE_SCHEMA.issue_fixversions_final FV
group by issueid, FV.sourceinstance
) FV
on FV.issueid = LKP.issueid
left join #DWH_TABLE_SCHEMA.f_work_item_fix_version DFV
on concat(FV.issueid, '~', coalesce(LKP.`to`, LKP.`from`, FV.earliest_fix_version_id))=DFV.row_id and FV.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.project_fixed_version_key,case when coalesce(LKP.`to`, LKP.`from`, FV.earliest_fix_version_id) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('fix version');