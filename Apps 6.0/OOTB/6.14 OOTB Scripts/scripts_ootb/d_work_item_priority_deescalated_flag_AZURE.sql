SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.priority_deescalated_flag' ELSE 'SUCCESS' END as Message

/*select SRC.__numerify__primary_key,prio_count.issueid, prio_count.sourceinstance, prio_count.prio_desc_cnt,
case when prio_count.prio_desc_cnt > 0 then 'Y' else 'N' end prio_esc_flg,
coalesce(TRGT.priority_deescalated_flag,'') tgt*/

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join
(
select SQ.issueid, SQ.sourceinstance, count(case when SQ.prio_desc_flg = 'Y' then 1 else null end) prio_desc_cnt
from
(
select base.issueid, base.sourceinstance, base.sequence_id, base.from, base.fromstring, base.to, base.tostring,
case when base.from < base.to then 'Y' else 'N' end prio_desc_flg
from
(
select tmp.issueid,tmp.sourceinstance, tmp.sequence_id, tmp.to, tmp.tostring, tmp.from, tmp.fromstring
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
where lower(tmp.field) = 'priority' and tmp.from is not null and tmp.primary_sequence_id <> 0
order by tmp.issueid,tmp.sourceinstance, tmp.sequence_id, tmp.tostring
) base
)SQ
group by SQ.issueid, SQ.sourceinstance
) prio_count

on SRC.__numerify__primary_key=prio_count.issueid
and SRC.sourceinstance=prio_count.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when prio_count.prio_desc_cnt > 0 then 'Y' else 'N' end,'N' )<>coalesce(TRGT.priority_deescalated_flag,'');