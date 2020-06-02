SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.re_prioritization_count' ELSE 'SUCCESS' END as Message

/*select SRC.id,SRC.sourceinstance, 
coalesce(re_prioritization_count.re_prioritization_count, 0) sr,
coalesce(TRGT.re_prioritization_count,'') tgt*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC

left join
(
select tmp.issueid, tmp.sourceinstance, count(coalesce(tmp.to, '')) re_prioritization_count
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
where tmp.field = 'PRIORITY' and coalesce(tmp.from, '') <> coalesce(tmp.to, '')
and tmp.from is not null and tmp.primary_sequence_id <> 0
group by tmp.issueid, tmp.sourceinstance
) re_prioritization_count

on SRC.id=re_prioritization_count.issueid
and SRC.sourceinstance=re_prioritization_count.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.f_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(re_prioritization_count.re_prioritization_count, 0)<>coalesce(TRGT.re_prioritization_count,'');