use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join 
(
select max(changelogid) max_changelog_week, issueid, sourceinstance, n_key
from #STG_TABLE_SCHEMA.changelog_monthly_temp 
group by issueid, sourceinstance, n_key
) LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
 
join (
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created
from #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final isu
on chnglog.issueid = isu.id and chnglog.sourceinstance = isu.sourceinstance
) tmp
on tmp.id = LKP.max_changelog_week and tmp.issueid = LKP.issueid and tmp.sourceinstance = LKP.sourceinstance

left join #MDS_TABLE_SCHEMA.issue_changelog_final updated_by
on updated_by.id = LKP.max_changelog_week and updated_by.issueid = LKP.issueid and updated_by.sourceinstance = LKP.sourceinstance

left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id

set SRC.last_updated_on = coalesce(convert_tz(tmp.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), D.work_item_updated_on), SRC.changed_by = updated_by.authorkey, SRC.updated_on = current_timestamp;