SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.re_prioriotization_count' ELSE 'SUCCESS' END as Message

/*select SRC.id,SRC.sourceinstance, 
coalesce(re_prioriotization_count.re_prioriotization_count, 0) sr,
coalesce(TRGT.re_prioriotization_count,'') tgt*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC

left join
(
select tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance, count(*) re_prioriotization_count
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
where field = 'PRIORITY' and coalesce(tmp.from, tmp.fromstring) <> coalesce(tmp.to, tmp.tostring)
and coalesce(tmp.from, tmp.fromstring) is not null
group by tmp.issue_changelog_issueid, tmp.issue_changelog_sourceinstance
) re_prioriotization_count

on SRC.id=re_prioriotization_count.issue_changelog_issueid
and SRC.sourceinstance=re_prioriotization_count.issue_changelog_sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.f_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(re_prioriotization_count.re_prioriotization_count, 0)<>coalesce(TRGT.re_prioriotization_count,'');