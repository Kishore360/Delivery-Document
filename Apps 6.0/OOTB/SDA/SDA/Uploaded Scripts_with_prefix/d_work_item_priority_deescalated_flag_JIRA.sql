SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.priority_deescalated_flag' ELSE 'SUCCESS' END as Message

/*select SRC.id,prio_count.issue_changelog_issueid, prio_count.issue_changelog_sourceinstance, prio_count.prio_esc_cnt,
case when prio_count.prio_esc_cnt > 0 then 'Y' else 'N' end prio_esc_flg,
coalesce(TRGT.priority_escalated_flag,'') tgt*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC

left join
(
select SQ.issue_changelog_issueid, SQ.issue_changelog_sourceinstance, count(case when SQ.prio_esc_flg = 'Y' then 1 else null end) prio_esc_cnt
from
(
select base.issue_changelog_issueid, base.issue_changelog_sourceinstance, base.issuechangelogid, base.from, base.fromstring, base.to, base.tostring,
case when base.from > base.to then 'Y' else 'N' end prio_esc_flg
from
(
select tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance, tmp.issuechangelogid, tmp.to, tmp.tostring, tmp.from, tmp.fromstring
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
where lower(tmp.field) = 'priority' and tmp.from is not null
order by tmp.issue_changelog_issueid,tmp.issue_changelog_sourceinstance, tmp.issuechangelogid, tmp.tostring
) base
)SQ
group by SQ.issue_changelog_issueid, SQ.issue_changelog_sourceinstance
) prio_count

on SRC.id=prio_count.issue_changelog_issueid
and SRC.sourceinstance=prio_count.issue_changelog_sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when prio_count.prio_esc_cnt > 0 then 'Y' else 'N' end,'N' )<>coalesce(TRGT.priority_escalated_flag,'');