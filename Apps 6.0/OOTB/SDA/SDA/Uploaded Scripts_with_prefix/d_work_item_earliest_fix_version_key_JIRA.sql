SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.earliest_fixed_version_key' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_final SRC
left join 
(
select FV.issueid, FV.sourceinstance, min(FV.id) earliest_fix_version_id
from #MDS_TABLE_SCHEMA.issue_fixversions_final FV
group by issueid, FV.sourceinstance
) FV
on FV.issueid = SRC.id
left join #DWH_TABLE_SCHEMA.f_work_item_fix_version LKP
on concat(FV.issueid, '~', FV.earliest_fix_version_id)=LKP.row_id
and FV.sourceinstance=LKP.source_id

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

where coalesce(LKP.project_fixed_version_key,case when FV.earliest_fix_version_id is null then 0 else -1 end)<>coalesce(TRGT.earliest_fixed_version_key,'');