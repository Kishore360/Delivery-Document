SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.multiple_assignment_flag' ELSE 'SUCCESS' END as Message

FROM #MDS_TABLE_SCHEMA.issue_final SRC 

left join (
select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, count(tmp.issue_changelog_issueid) count_asgn
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
where lower(tmp.field) = 'assignee' and (tmp.fromstring is not null or tmp.`from` is not null)
group by tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance
) assignment
on SRC.id=assignment.issue_changelog_issueid
and SRC.sourceinstance=assignment.issue_changelog_sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 
where coalesce(CASE WHEN assignment.count_asgn>0 THEN 'Y' ELSE 'N' end,'N' ) <>coalesce(TRGT.multiple_assignment_flag,'');