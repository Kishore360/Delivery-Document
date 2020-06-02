SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.reprioritization_flag' ELSE 'SUCCESS' END as Message

/*select SRC.__numerify__primary_key,SRC.sourceinstance, reprioritization.base_priority, SRC.msvsts_common_priority,
coalesce(case when reprioritization.base_priority <> SRC.msvsts_common_priority then 'Y' else 'N' end, 'N') sr,
coalesce(TRGT.reprioritization_flag,'') tgt*/

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

/*left join
(
select tmp.issueid, tmp.sourceinstance, tmp.from as base_priority, min(created)
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from (select * from (select * from #STG_TABLE_SCHEMA.issue_activity_azure_base base where base.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp where tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE')) tmp
where field = 'PRIORITY' and coalesce(tmp.from) <> coalesce(tmp.to)
and tmp.from is not null
group by tmp.issueid, tmp.sourceinstance
) reprioritization*/

left join
(
select tmp.issueid, tmp.sourceinstance, count(tmp.to) reprioritization_cnt
  -- coalesce(tmp.from, tmp.fromstring), coalesce(tmp.to, tmp.tostring)
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
where tmp.field = 'PRIORITY' and coalesce(tmp.from, '') <> coalesce(tmp.to, '')
and tmp.from is not null and tmp.primary_sequence_id <> 0
group by tmp.issueid, tmp.sourceinstance
) reprioritization

on SRC.__numerify__primary_key=reprioritization.issueid
and SRC.sourceinstance=reprioritization.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
-- where coalesce(case when reprioritization.base_priority <> SRC.msvsts_common_priority or  then 'Y' else 'N' end, 'N')<>coalesce(TRGT.reprioritization_flag,'');
where coalesce(case when reprioritization.reprioritization_cnt > 0 then 'Y' else 'N' end, 'N')<>coalesce(TRGT.reprioritization_flag,'');