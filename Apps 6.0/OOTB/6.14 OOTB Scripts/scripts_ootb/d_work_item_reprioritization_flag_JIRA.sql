SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.reprioritization_flag' ELSE 'SUCCESS' END as Message

/*select SRC.id,SRC.sourceinstance, reprioritization.base_priority, SRC.priority_id,
coalesce(case when reprioritization.base_priority <> SRC.priority_id then 'Y' else 'N' end, 'N') sr,
coalesce(TRGT.reprioritization_flag,'') tgt*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC

left join
(
select tmp.issueid, tmp.sourceinstance, count(coalesce(tmp.to, '')) reprioritization_cnt
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
where tmp.field = 'PRIORITY' and coalesce(tmp.from, '') <> coalesce(tmp.to, '')
and tmp.from is not null and tmp.primary_sequence_id <> 0
group by tmp.issueid, tmp.sourceinstance
) reprioritization

on SRC.id=reprioritization.issueid
and SRC.sourceinstance=reprioritization.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when reprioritization.reprioritization_cnt > 0 then 'Y' else 'N' end, 'N')<>coalesce(TRGT.reprioritization_flag,'');