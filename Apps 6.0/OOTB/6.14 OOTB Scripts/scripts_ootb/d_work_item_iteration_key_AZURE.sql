SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.iteration_key' ELSE 'SUCCESS' END as Message
/*select TRGT.row_id, TRGT.row_key, TRGT.soft_deleted_flag,
COALESCE(activity.tostring, 'UNKNOWN') AS iteration_id,
coalesce(IT.row_key,case when activity.tostring is not null then -1 else 0 end), TRGT.iteration_key*/

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join 
(
select temp.issueid, temp.sourceinstance, temp.tostring
from #STG_TABLE_SCHEMA.issue_activity_azure_base temp
join (select issueid, sourceinstance, max(primary_sequence_id) as max_primary_sequence_id
from #STG_TABLE_SCHEMA.issue_activity_azure_base
where field = 'ITERATION'
group by issueid, sourceinstance) base
on temp.issueid = base.issueid and temp.sourceinstance = base.sourceinstance and temp.primary_sequence_id = base.max_primary_sequence_id
where temp.field = 'ITERATION') activity
on activity.issueid = SRC.__numerify__primary_key and SRC.sourceinstance = activity.sourceinstance

left join #DWH_TABLE_SCHEMA.d_iteration IT
on COALESCE(activity.tostring, 'UNKNOWN')=IT.row_id and activity.sourceinstance = IT.source_id

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
where coalesce(IT.row_key,case when activity.tostring is not null then -1 else 0 end) <> coalesce(TRGT.iteration_key,'');